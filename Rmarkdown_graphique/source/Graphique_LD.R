ggplot(data = mtcars, 
       aes(x = hp, y = mpg, size = disp)) + geom_point()