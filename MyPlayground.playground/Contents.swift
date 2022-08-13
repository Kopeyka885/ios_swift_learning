//TODO: Определить две константы a и b типа Double, присвоить им любые значения. Вычислить среднее значение и сохранить результат в переменную average.
print("---------------------------------------------------------------------------------------------")
let a = 3.14
let b = 5.25

let average = (a+b)/2
print("average of a = \(a) and b = \(b) = \(average)")

print()
//TODO: Создать кортеж, и задать два любых строковых значения с названиями firstName и lastName. Далее необходимо вывести в консоль строку в формате "Full name: [firstName] [lastName]".
print("---------------------------------------------------------------------------------------------")

let human = (firstName: "Kamil", lastName: "Kadyrov")
print("Full name: \(human.firstName) \(human.lastName)")
print("Full name: \(human.0) \(human.1)")
print()

//TODO: Создать две опциональные переменные типа Float. Одной из них задать первоначальное значение. Написать функцию, которая принимает на вход опциональную переменную типа Float. Функция должна безопасно извлечь значение из входящей переменной. Если значение удалось получить - необходимо вывести его в консоль, если значение у переменной отсутствует вывести в консоль фразу "Variable can't be unwrapped". Вызвать функцию дважды с двумя ранее созданными переменными.
print("---------------------------------------------------------------------------------------------")

let x: Float? = 23.5
let y: Float? = nil

func unwrapFloat(number : Float?) {
    if number != nil {
        print(number!)
    } else {
        print("Variable can't be unwrapped")
    }
}

func unwrapFloat2(number : Float?) {
    if let number = number {
        print(number)
    } else {
        print("Variable can't be unwrapped")
    }
}

func unwrapFloat3(_ number: Float?){
    if let number = number {
        print(number)
    } else {
        print("Variable can't be unwrapepd")
    }
}

func unwrapFloatWithGuard(_ number: Float?){
    guard let number = number else
    {
        print("Variable can't be unwrapped")
        return
    }
    print(number)
}

unwrapFloat(number:x)
unwrapFloat(number: y)
print()
unwrapFloat2(number: x)
unwrapFloat2(number: y)
print()
unwrapFloat3(x)
unwrapFloat3(y)
print()
unwrapFloatWithGuard(x)
unwrapFloatWithGuard(y)
print()

//TODO: Напишите программу для вывода первых 15 чисел последовательности Фибоначчи
print("---------------------------------------------------------------------------------------------")

let amountOfSteps = 15

var prePreviousStep = 0
print(prePreviousStep)

var previousStep = 1
print(previousStep)

var result = 0
for _ in 2..<amountOfSteps{
    result = prePreviousStep + previousStep
    prePreviousStep = previousStep
    previousStep = result
    print(result)
}

print()
//TODO: Напишите программу для сортировки массива, использующую метод пузырька. Сортировка должна происходить в отдельной функции, принимающей на вход исходный массив.
print("---------------------------------------------------------------------------------------------")

//классика
func bubbleSort1(inputArray: [Int]) -> [Int]{
    var massive = inputArray
    for i in 1...(massive.count - 1){
        for j in 0...(massive.count - i - 1){
            if massive[j] > massive[j+1]{
                let tmp = massive[j]
                massive[j] = massive[j+1]
                massive[j+1] = tmp
            }
        }
    }
    return massive
}

//не выделяем лишнюю память
func bubbleSort2(inputArray: inout [Int]){
    for i in 1 ..< inputArray.count{
        for j in 0 ..< (inputArray.count - i){
            if inputArray[j] > inputArray[j+1]{
                inputArray.swapAt(j, j+1)
            }
        }
    }
}

let massive1 = [13, 3, 8, 1, 15, 2, 3, 7, 4]
var massive2 = bubbleSort1(inputArray: massive1)
var massive3 = massive1
bubbleSort2(inputArray: &massive3)

print(massive2)
print(massive3)

print()
//TODO: Напишите программу, решающую задачу: есть входящая строка формата "abc123", где сначала идет любая последовательность букв, потом число. Необходимо получить новую строку, в конце которой будет число на единицу больше предыдущего, то есть "abc124".
print("---------------------------------------------------------------------------------------------")

// looks like хуйня, что-то мне совсем не нравится, но как сделать лучше не ебу, в while не запихивается дополнительное условие, if/else не меняется на тернарник -_- . Зато теперь все безопасно вроде

func increaseEndingNumberOfString(inputString: String) -> String{
    var outputString = inputString
    var str = ""
    while let lastCharacter = outputString.popLast(){
        if lastCharacter.isNumber{
            str.insert(lastCharacter, at: str.startIndex)
        } else {
            break
        }
    if let convertedString = Int(str){
        outputString += String(convertedString + 1)
    }
    return outputString
}

var testString = "Kamil999"
print(increaseEndingNumberOfString(inputString: testString))

print()
//TODO: Написать простое замыкание в переменной myClosure, замыкание должно выводить в консоль фразу "I love Swift". Вызвать это замыкание. Далее написать функцию, которая будет запускать заданное замыкание заданное количество раз. Объявить функцию так: func repeatTask (times: Int, task: () -> Void). Функция должна запускать times раз замыкание task. Используйте эту функцию для печати «I love Swift» 10 раз.
print("---------------------------------------------------------------------------------------------")

var myClosure = {
    print("I love Swift")
}

func repeatTask (times: Int, task: () -> Void){
    for _ in 0..<times {
        task()
    }
}

repeatTask(times: 10, task: myClosure)

print()
//TODO: Условия: есть начальная позиция на двумерной плоскости, можно осуществлять последовательность шагов по четырем направлениям up, down, left, right. Размерность каждого шага равна 1. Создать перечисление Directions с направлениями движения. Создать переменную location с начальными координатами (0,0), создать массив элементами которого будут направления из перечисления. Положить в этот массив следующую последовательность шагов: [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]. Программно вычислить, какие будут координаты у переменной location после выполнения этой последовательности шагов.
print("---------------------------------------------------------------------------------------------")

enum Directions{
    case up, down, left, right
}

var location = (0,0)
let stepsSequence: [Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]

for step in stepsSequence{
    switch(step){
        case .up:
        location.1 += 1
    case .left:
        location.0 -= 1
    case .right:
        location.0 += 1
    case .down:
        location.1 -= 1
    }
}

print(location)
print()
//TODO: Создать класс Rectangle с двумя неопциональными свойствами: ширина и длина. Реализовать в этом классе метод вычисляющий и выводящий в консоль периметр прямоугольника. Создать экземпляр класса и вызвать у него этот метод.
print("---------------------------------------------------------------------------------------------")

class Rectangle{
    var width = 0.0
    var length = 0.0
    var perimetr: Double {
        2 * (width + length)
    }
    
    init(width: Double, length: Double){
        self.width = width
        self.length = length
    }
}

let rectangle = Rectangle(width: 8, length: 10)
print(rectangle.perimetr)
print()

//TODO: Создать расширение класса Rectangle, которое будет обладать вычисляемым свойством площадь. Вывести в консоль площадь уже ранее созданного объекта.
print("---------------------------------------------------------------------------------------------")

extension Rectangle{
    var square: Double {
        width * length
    }
}

print(rectangle.square)
print()


let str: String?
str = "Kamil QA"
