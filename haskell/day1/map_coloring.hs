module Main where

    available_colors = ["red", "green", "blue"]
    color_mapping = [(("Tennessee", t), ("Mississipi", m), ("Alabama", a), ("Georgia", g), ("Florida", f))
        | t <- available_colors,
        m <- available_colors,
        a <- available_colors,
        g <- available_colors,
        f <- available_colors,
        t /= m, t /= a, t/= g,
        m /= a,
        a /= g, a /= f,
        g /= f]
