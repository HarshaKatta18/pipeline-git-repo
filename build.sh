#!/bin/bash
echo "=== Building DevOps Application ==="

echo "Cleaning old builds..."
rm -rf bin
mkdir -p bin

echo "Compiling source files..."
find src -name "*.java" > sources.txt
javac -d bin @sources.txt
echo "Compilation complete."

echo "=== Running Tests ==="
java -cp bin com.example.HelloDevOpsTest
echo "Tests completed."

echo "=== Creating JAR ==="
jar cfe app.jar com.example.HelloDevOps -C bin .
echo "JAR created: app.jar"

echo "=== Running Application ==="
java -jar app.jar
