def recursive_apply_func(list_structure, func):
    if isinstance(list_structure, list):
        return list(map(
            lambda x: recursive_apply_func(x, func),
            list_structure))
    elif isinstance(list_structure, tuple):
        return tuple(map(
            lambda x: recursive_apply_func(x, func),
            list_structure))
    else:
        return func(list_structure)
