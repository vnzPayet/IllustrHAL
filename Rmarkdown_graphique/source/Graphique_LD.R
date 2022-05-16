graphLD <- ggplot(data = mtcars, 
                  aes(x = hp, y = mpg, size = qsec)) + geom_point()

print(graphLD)
