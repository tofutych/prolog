open System


let checker num = 
    let rec digitsSum num current_num =
        if (num = 0) then current_num
        else 
            let new_sum = current_num + Math.Pow((float)num % 10.0, 5.0) // Pow почему-то только для float работает.
            digitsSum (num/10) new_sum  // идем на следуюший шаг рекурсии с отсеченной последней цифрой и новой суммой!
    digitsSum num 0.0


let counter = 
    let rec meow current_num sum =
        if (current_num = 389140) then sum  (*ограничимся  этим значением - какие-то типы на сайберфоруме оценивали верхнюю границу этой задачи (dxdy.ru/topic104639.html)*)
        else if (checker current_num = (float)current_num) then  
            let new_sum = current_num + sum
            meow (current_num + 1) new_sum  // если необходимое свойство выполняется, то, естественно суммируем и идем на следующий шаг рекурсии с новым счетчиком и новой суммой!
        else
            meow (current_num + 1) sum
    meow 2 0  // пропускаем единицу, тк 1^5 = 1^5 - не сумма!


[<EntryPoint>]
let main argv =
    let sum = counter
    Console.WriteLine(sum.ToString())
    0
