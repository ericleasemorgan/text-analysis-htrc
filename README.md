# HathiTrust Research Center Workset Browser

README - An introductory description to this, the HathiTrust Research Center Workset Browser

  draft Draft Draft! DRAFT! DRAFT!!!  D R A F T ! ! ! 
  
  This, the HathiTrust Research Center Workset Browser ("Browser"), is a
  suite of software used to do "distant reading" against sets of digitized
  items from the HathiTrust. With the advent of globally networked
  computers, the availability of textual items in the public domain has
  increased significantly. Moreover, the ability to turn the power of
  computing against textual items has made it easier to "read" said items
  in a manner never (really) possible before. The Browser is a tool for
  doing such "reading".

  The current home page of the Browser is http://bit.ly/workset-browser
  
  An example of its current output is: http://bit.ly/browser-thoreau


Quick start

    1. Download the software putting the bin and etc directories in the same directory
    
    2. Change to the directory where the bin and etc directories have been saved.
    
    3. Build a collection by issuing the following command:
    
         ./bin/build-corpus.sh thoreau etc/rsync-thoreau.sh

  If all goes well, the Browser will create a new directory named thoreau,
  rsync a bunch o' JSON files from the HathiTrust to your computer, index
  the JSON files, do some textual analysis against the corpus, create a
  simple database ("catalog"), and create a few more reports.
  
  If you have R installed, as well as some of R's friends, then you can
  optionally run the following command to generate some charts:
  
    ./bin/make-graphs.sh thoreau
  
  You can then peruse the files in the newly created thoreau directory. Of
  special interest is the file named about.html because it summarizes the
  collection. If you created the charts, then there ought to be no broken
  links in the file. If the file is being served via a Web server, then
  the search interface will work. If not, then you can still search the
  collection with the following command:

    ./bin/search.sh love thoreau | less
    
  If you got this far, then repeat the process for the other rsync files
  found in the etc directory.
  
  
Requirements

  The Browser requires a computer running a "sane" version of a Linux-ish
  operating system coupled with the Python scripting language. Few, if
  any, specialized pieces of software are needed with the possible
  exception of an application called rsync. Similarly, few, if any,
  special Python modules are required with the exception of the Natural
  Language Toolkit, and this requirement may go to the wayside since all
  it currently does is supply lists of stop words. All that said, the
  Browser ought to run on most out-of-the box Internet network servers and
  Macintosh computers. Since the ultimate goal is to implement the Browser
  as a Web-based service, no special effort has been made to accommodate
  Windows.


License

  This software is distributed under the GNU General Public License.
  
  
Installation

  [Describe how to install the Browser here.]
  

Usage

  Here is an outline of how the Browser is intended to be used:

    0. Articulate a research question such as "What are some of the
       characteristics of early American literature, and how might some of
       its authors be compared & contrasted?" or "What are some of the
       definitions of a 'great' man, and how have these definitions changed
       over time?"

    1. Use the HathiTrust Research Center Portal to create or refine a
       corpus of works that may help you answer the research question.

    2. Use the Research Center's Algorithm interface to download an rsync
       file listing the items in your corpus.

    3. Feed the rsync file to the Browser, and it will harvest your
       corpus locally, create a catalog of the corpus, index the full text
       of the corpus, create sets of files against the corpus intended to
       be used by other (operating system independent) applications, and
       generate a report summarizing the content the corpus.

    4. Use and understand your corpus -- try to answer your research
       question -- by reading the Browser-generated report, searching the
       corpus's content with the supplied search interface, or applying
       other applications/tools (such as Excel, Solr, MySQL, R's tm module,
       or Python's NLTK library) to the Browser's underlying output files.

    5. Go to Step #1.

  The current version of the Browser is akin to cartoon as drawn by a
  Renaissance artist or a blueprint as drawn by an architect. As such
  is an outline of possible things to come, and its implementation is
  -- by design -- simple and foundational. You have been warned. 


Manual

  [Here goes the documentation of the scripts.]
  

Cookbook

  [This is a list of the ways the scripts can be chained together to do
  "kewl" stuff.]
  

--
Eric Lease Morgan, Librarian
University of Notre Dame
emorgan@nd.edu

June 2, 2015