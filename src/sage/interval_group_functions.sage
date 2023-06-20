def find_words_form_levels(letters, target):
    all_n_words = tuple(iter.product(letters, repeat=len(target)))
    all_matching_words = tuple(word for word in all_n_words if prod(word)==prod(target))
    levels = form_levels(all_matching_words)

    return levels, all_matching_words




def form_levels(chains):
    all_levels = ()
    
    for i in range(len(chains[0]) + 1):
        current_level = ()
        # Initialize prefixes
        remaining_prefixes = tuple(chain[0:i] for chain in chains)

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
        



