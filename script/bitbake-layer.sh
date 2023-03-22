#!/bin/bash

# Add a layer to the build environment
function add_layer {
    bitbake-layers add-layer $1
}

function create_layer {
    bitbake-layers create-layer $1
}

# Remove a layer from the build environment
function remove_layer {
    bitbake-layers remove-layer $1
}

# List the layers in the build environment
function list_layers {
    bitbake-layers show-layers
}

# Display information about a layer
function layer_info {
    bitbake-layers show-layer $1
}

# Display the configuration of a layer
function layer_config {
    bitbake-layers show-config $1
}

# Manipulate the configuration of a layer
function edit_layer_config {
    bitbake-layers edit-config $1
}

# Display the dependencies of a layer
function layer_deps {
    bitbake-layers show-dependencies $1
}

# Display the reverse dependencies of a layer
function layer_rdeps {
    bitbake-layers show-reverse-dependencies $1
}

# Display the conflicts of a layer
function layer_conflicts {
    bitbake-layers show-recipes --summary $1 | grep 'Conflicts:' | cut -d ':' -f 2-
}

# Display the recipes in a layer
function layer_recipes {
    bitbake-layers show-recipes --summary $1 | grep 'Name:' | cut -d ':' -f 2-
}

# Main function to parse command-line arguments
function main {
    case $1 in
    add)
        add_layer $2
        ;;
    remove)
        remove_layer $2
        ;;
    list)
        list_layers
        ;;
    info)
        layer_info $2
        ;;
    config)
        layer_config $2
        ;;
    editconfig)
        edit_layer_config $2
        ;;
    deps)
        layer_deps $2
        ;;
    rdeps)
        layer_rdeps $2
        ;;
    conflicts)
        layer_conflicts $2
        ;;
    recipes)
        layer_recipes $2
        ;;
    create)
        create_layer $2
        ;;
    *)
        echo "Usage: $0 {create|add|remove|list|info|config|editconfig|deps|rdeps|conflicts|recipes} [layer]"
        ;;
    esac
}

main $@
