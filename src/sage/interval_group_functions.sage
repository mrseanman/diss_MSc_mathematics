def form_levels(chains):
    all_levels = ()
    
    for i in range(len(chains[0])):
        current_level = ()
        # Initialize prefixes
        remaining_prefixes = tuple(chain[0:i+1] for chain in chains)

        while not len(remaining_prefixes)==0:
            current_test = remaining_prefixes[0]
            matches     = tuple(val for val in remaining_prefixes if prod(val)==prod(current_test))
            non_matches = tuple(val for val in remaining_prefixes if prod(val)!=prod(current_test))

            current_level = current_level + (matches,)
            remaining_prefixes = non_matches
        all_levels = all_levels + (current_level,)
    return all_levels

def pprint_levels(levels):
    for i, level in enumerate(levels):
        print("=================================")
        print(" LEVEL: " + str(i))
        for grouping in level:
            print(set(grouping))
            print(" - ")
        



