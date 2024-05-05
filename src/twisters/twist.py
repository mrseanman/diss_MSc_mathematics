def twist_about(line, twist_center):
    sharpness = 1
    twist_amount = lambda x: pi * exp(-sharpness * ((2*(x-twist_center)-1)*(2*(x-twist_center)+1))^2)

    return [(x-twist_center) * exp(I*twist_amount(real_part(x))) + twist_center for x in line]

start_point = -2
end_point = 2
n_intervals = 1000

real_line = [N(x/n_intervals) for x in [start_point*n_intervals..end_point*n_intervals]]

real_line_twisted = twist_about(real_line, 0.5)
real_line_twisted_2 = twist_about(real_line_twisted, -0.5)

v = [(N(real_part(x)), N(imag_part(x))) for x in real_line_twisted_2]

show(points(v))
