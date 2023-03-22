#!/bin/bash

# Make sure you have sourced the Yocto Project environment
# source oe-init-build-env

# Set variables
RECIPE_NAME="example-recipe"
SOURCE_URL="https://github.com/user/example.git"
LAYER_PATH="meta-custom"

# Add a new recipe
devtool add "${SOURCE_URL}" "${RECIPE_NAME}"

# Modify the recipe (opens the recipe in the default editor)
devtool modify "${RECIPE_NAME}"

# Build the modified recipe
devtool build "${RECIPE_NAME}"

# Test the new image (assumes you have an existing image named 'core-image-minimal')
devtool testimage -i core-image-minimal

# Update the recipe to a new version (replace NEW_SOURCE_URL with the updated source URL)
NEW_SOURCE_URL="https://github.com/user/example.git"
devtool upgrade "${RECIPE_NAME}" "${NEW_SOURCE_URL}"

# Reset the environment (removes changes made to the recipe)
devtool reset "${RECIPE_NAME}"

# Finish the development process (create patches and update the original recipe)
devtool finish "${RECIPE_NAME}" "${LAYER_PATH}"
