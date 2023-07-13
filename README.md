# R & Python Blog

Click [here](https://csc-ubc-okanagan.github.io/R-Python-Blog/) to go to the blog.

# Using GitHub

## Basic GitHub Actions

### To clone this repo to your local machine using GitHub Desktop (Windows or MacOS):

If needed, start by installing [GitHub Desktop](https://desktop.github.com/) on your machine. Then click on the green button on the [repo homepage](https://github.com/csc-ubc-okanagan/R-Python-Blog) (likely the page you're currently on) and select `Open with GitHub Desktop`. The repo will now be copied to your machine, and you can manage it easily within GitHub Desktop.


### To clone this repo to your local machine using a terminal:

Open a command terminal and navigate to the folder you would like to store this folder in.

On the [repo homepage](https://github.com/csc-ubc-okanagan/R-Python-Blog) (likely the page you're currently on), there is a green button that says ```code```. Click this, and then copy the repo URL here.

In your command terminal type:

```git clone URL```


#### Note: (Windows) 

To navigate through folders, type ```cd FolderName``` to travel down into it. 

To travel upwards, type ```cd ..``` to travel up one level, and ```cd ../..``` to travel up two, etc. 

To see a list of the current files in the current folder, type ```ls```. 


### To pull changes:

In a command terminal, navigate to this cloned repo. Before uploading new changes, you must check to see if there are updates that you should 'pull', type ```git pull```.


### To push changes:

In a command terminal, navigate to this cloned repo. 

1. Type ```git add .```
2. Type ```git commit -m "MESSAGE"```
3. Type ```git push```

For more basic GitHub commands and workflow learnings, visit [this link here.](https://docs.github.com/en/get-started/using-git/about-git)

# Using the Repo to Update the Blog

## Writing A Post

1. To create a new post on the blog, first create a new `.RMD` file in the `_src` folder. The naming convention should begin with the date (YYY-MM-DD), followed by the article title. All spaces will be documented with a dash. For example, `2023-06-21-Intro-to-Python`.

2. The top section of the document should look like this example:
```
---
title:  Dictionaries in Python # update this title which will be viewable in the blog
date: '2023-06-21 09:00:00 -0800' # update the date - the time isn't overly important
categories:  [Python, P_Getting Started] # update these categories with the primary category first, sub category second
tags: [python] # tags always lowercase except for just 'R' as a tag
author: madison # update this accordingly
output: md_document
---
   ```
3. Begin writing the body of the post as a normal `.rmd` document with text, code chunks in R, Python, or both!

4. Once the post is completed, knit the file. In the `_src` file, the `.rmd` file will remain. It will knit the completed `md` file to the `_posts` folder.

Once this is done, commit the changes to the repo and the new blog version should be deployed.

## Categorizing Posts

The layout of the 'Categories' tab will follow this structure:

- Python
    - P_Getting Started
    - P_IDE
    - P_Data
    - P_Visualization
    - P_Modelling
    - P_Advanced
- R
    - R_Getting Started
    - R_IDE
    - R_Data
    - R_Visualization
    - R_Modelling
    - R_Advanced

All posts will fall into these categories, with Python and R as the primary categories, with identical subcategories. 

## Tagging Posts

The tags will be listed in all lowercase, with the exception of `R`. Multiple tags can be listed in each blog post.
