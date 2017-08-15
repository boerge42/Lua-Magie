function power(ex)
   return function(x)
            return x^ex	
          end
end

-- Closure erzeugen
square = power(2) 
cubic =  power(3)

print(square(5))  --> 5^2
print(cubic(3))   --> 3^3
print(cubic(4))   --> 4^3
print(square(4))  --> 4^2
