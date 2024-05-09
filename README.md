# SwiftHierarchy

This README provides an overview of a Bash script designed to upload files to an object storage system while mimicking a hierarchical folder structure based on a given prefix.

## Overview

When working with object storage systems, organizing data into a hierarchical structure resembling traditional file systems is common. This script simplifies the creation of such a structure by appending a user-defined prefix to filenames before uploading them to the object storage.

## Usage

1. **Install OpenStack CLI Utilities**: Ensure you have the necessary tools installed by running the provided installation command.

2. **Configure the Environment**: Enter the authentication URL and token when prompted.

3. **Define the Prefix**: Specify the prefix to add to filenames to mimic the folder structure.

4. **Execute the Script**: Run the script in the directory containing the files you want to upload.

## Script Explanation

### swift.sh

This script is used to upload files to OpenStack Swift object storage. It performs the following steps:

1. Installs the necessary OpenStack CLI utilities.
2. Prompts the user to enter the authentication URL, token, and prefix.
3. Checks if a prefix is provided.
4. Iterates through all files in the current directory, constructs the target path in Swift storage by adding the prefix to the filename, and uploads the file to Swift with the provided prefix.

### taxonomy.txt

This file provides a sample taxonomy structure with classes and subclasses, serving as a template for organizing data into a hierarchical structure.

### createfolders.sh

This script is used to create folders within OpenStack Swift object storage based on the taxonomy structure defined in the `taxonomy.txt` file. It performs the following steps:

1. Prompts the user to enter the authentication URL, token, and the path to the `template_hierarchy.txt` file.
2. Checks if the template file exists.
3. Defines a function to create folders recursively.
4. Reads each line from the template file, extracts class or subclass names, and creates folders in Swift storage accordingly.
5. Recursively creates subfolders if they exist.
6. Starts folder creation from the root.

## Example

Suppose you have a taxonomy structure with classes and subclasses, and you want to utilize this structure to organize your data in object storage. You can run the provided scripts in the directory containing your data files and taxonomy file, providing the appropriate authentication credentials and prefix. The scripts will then upload the files to object storage, arranging them into folders and subfolders based on the provided taxonomy structure.

## Script Update

The scripts provided have been updated to remove redundant code and streamline the process of uploading files and creating folders in object storage. Now, users only need to input the authentication details, prefix, and template file path, and the scripts handle the rest.