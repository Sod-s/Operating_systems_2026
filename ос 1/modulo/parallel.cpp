#include <iostream>
#include <windows.h> // Главный заголовочный файл для работы с процессами в Windows
#include "math_functions.h"

int main(int argc, char* argv[]) {
    int num = 10;

    // Создание Мьютекса для синхронизации доступа к консоли
    // Если он уже создан, функция просто откроет существующий
    HANDLE hMutex = CreateMutexA(NULL, FALSE, "OS_Lab_Mutex");
    if (hMutex == NULL) {
        std::cerr << "Ошибка создания мьютекса!" << std::endl;
        return 1;
    }

    // Проверка аргументы командной строки.
    // Если аргументов нет — это запуск РОДИТЕЛЬСКОГО процесса.
    if (argc == 1) {
        std::cout << "[РОДИТЕЛЬ] Запуск работы..." << std::endl;

        // Нужно запустить саму себя еще раз, но передать аргумент "child",
        // чтобы копия программы знала, что она — ПОТОМОК.
        char childCmd[] = "parallel.exe child";

        STARTUPINFOA si;
        PROCESS_INFORMATION pi;
        ZeroMemory(&si, sizeof(si));
        si.cb = sizeof(si);
        ZeroMemory(&pi, sizeof(pi));

        // Системный вызов Windows для создания нового параллельного процесса (аналог fork)
        if (!CreateProcessA(
                NULL,           // Имя модуля
                childCmd,       // Командная строка для потомка
                NULL,           // Дескриптор процесса не наследуется
                NULL,           // Дескриптор потока не наследуется
                FALSE,          // Флаг наследования дескрипторов
                0,              // Флаги создания
                NULL,           // Окружение родителя
                NULL,           // Текущий каталог родителя
                &si,            // Указатель на STARTUPINFO
                &pi             // Указатель на PROCESS_INFORMATION
            )) {
            std::cerr << "Ошибка при создании процесса-потомка! Код: " << GetLastError() << std::endl;
            return 1;
        }

        // Работа родителя
        // Захват мьютекса перед выводом на экран (блокировка)
        WaitForSingleObject(hMutex, INFINITE);
        
        std::cout << "[РОДИТЕЛЬ] Считаю факториал..." << std::endl;
        std::cout << "[РОДИТЕЛЬ] Результат Факториала(" << num << ") = " << factorial(num) << std::endl;
        
        // Освобождение мьютекса, давая дорогу потомку
        ReleaseMutex(hMutex);

        // Ожидание, пока процесс-потомок завершит свою работу
        WaitForSingleObject(pi.hProcess, INFINITE);

        // Закрытие дескрипторов процесса
        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
        CloseHandle(hMutex);
        
        std::cout << "[РОДИТЕЛЬ] Потомок завершился. Программа успешно закончена." << std::endl;

    } else if (argc > 1 && std::string(argv[1]) == "child") {
        // Работа потомка
        // Попытка захватить мьютекс. Если родитель уже там, потомок "заснет" и будет ждать
        WaitForSingleObject(hMutex, INFINITE);
        
        std::cout << "[ПОТОМОК] Считаю числа Фибоначчи..."  << std::endl;
        std::cout << "[ПОТОМОК] Результат Фибоначчи(" << num << ") = " << fibonacci(num)  << std::endl;
        
        // Освобождение мьютекса
        ReleaseMutex(hMutex);
        CloseHandle(hMutex);
    }

    return 0;
}