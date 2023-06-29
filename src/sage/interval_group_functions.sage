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
        

def generate_graph_make_plot(levels):
    initial_object = levels[0][0][0]
    G = Graph()
    # Add e
    G.add_vertex(initial_object)

    # Start from 1st level (not 0th)
    for level in levels[1:]:
        for grouping in level:
            initial_grouping_element = grouping[0]
            G.add_vertex(initial_grouping_element)       
            
            parents_and_labels = find_parents_and_labels(initial_grouping_element, levels)

            for parent, label in parents_and_labels:
                G.add_edge((parent, initial_grouping_element, str(label)))
    
    G.set_pos(get_positions(levels))

    p = G.graphplot(vertex_size=3500,
                    vertex_labels=True,
                    edge_labels= True,
                    color_by_label=True)

    return G, p

    

# Find all elements in relevant grouping which are parents to the grouping argument
def find_parents_and_labels(element, levels):
    level = len(element)
    all_groupings_for_element_arg = levels[level]
    
    # TODO check that there is always only one element in this

    specific_grouping_containing_element_arg = [
        group for group in all_groupings_for_element_arg if element in group]
    

    specific_grouping = specific_grouping_containing_element_arg[0]
    specific_grouping_suffixes = [word[-1] for word in specific_grouping]
    potential_parent_groups = levels[level-1]
    parent_reps_and_edges = []

    first_elements_of_parent_groups = []
    for potential_parent_group in potential_parent_groups:
        for suffix in specific_grouping_suffixes:
            if any(map(lambda x: (x + (suffix,)) in specific_grouping, potential_parent_group)):
                parent_reps_and_edges.append((potential_parent_group[0], suffix))
    
    return list(set(parent_reps_and_edges))


def get_positions(levels):
    width_multiplier = 30.0
    height_multiplier = 100.0
    positions = {}
    for level_index, level in enumerate(levels):
        total_size_of_level = len(level) - 1
        for group_index, group in enumerate(level):
            positions[group[0]] = (
                (group_index - total_size_of_level/2.) * width_multiplier,
                level_index * height_multiplier)
    return positions

