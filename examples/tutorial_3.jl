function equi_triangle(a)
    return sqrt(3) / 4 * a^2
end

function inscribed_circle(a)
    a^2 * (pi/3)
end

equi_triangle(a) - inscribed_circle(a)