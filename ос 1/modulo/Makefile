# ”казываем компил€тор
CXX = g++
# ‘лаги компил€ции (включаем предупреждени€ и оптимизацию O2)
CXXFLAGS = -Wall -O2

# »м€ готовой программы
TARGET = os_lab_prog

# —борка проекта
all: main.cpp math_functions.cpp
	$(CXX) $(CXXFLAGS) main.cpp math_functions.cpp -o $(TARGET)

# ќчистка папки от собранного файла
clean:
	rm -f $(TARGET)