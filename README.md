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

  The current home page of the Browser is https://github.com/ndlib/text-analysis-htrc
  

Quick start, the first part

  Use these steps to get up an running quickly.

    1. Create a HathiTrust Research Center "data capsule".
    
    2. Use SSH or VNC to connect to the capsule.
    
    3. From the command line, use git to install the software:
    
         git clone https://github.com/ndlib/text-analysis-htrc.git
    
    4. Change directories accordingly:
    
         cd text-analysis-htrc
    
    5. Make the scripts executable:
    
         chmod +x ./bin/*

    6. Search the sample collection:
    
         ./bin/search.sh love austen
         
    7. Read the "about" page:
    
         firefox ./collections/austen/about.html

    8. Browse the catalog:
    
         firefox ./collections/austen/catalog.html

    9. Create an additional collection:
    
         ./bin/build-corpus.sh bronte ./etc/rsync-bronte.sh

    10. Create an even bigger collection, and be patient:
    
         ./bin/build-corpus.sh baxter ./etc/rsync-baxter.sh

Quick start, the second part

Once you have gotten this far, you will probably want to create your own collection. Here's how:

    1. Search & browse the HathiTrust for items of interest.
    
    2. Save the interesting items to a collection.
    
    3. Download teh collection's metadata to your local computer.
    
    4. Upload the metadata into a HathiTrust Research Center "workset"
    
    5. Use the EF Rsync Script Generator algorithm to create and rsync.sh file.
    
    6. Download the rsync.sh file to yoru local computer.
    
    7. Using an identifiable name, upload the rsync.sh file to text-analysis-htrc/etc.
    
    8. Build your collection:
    
         ./bin/build-corpus.sh mycollection ./etc/rsync-mycollection.sh
    
    9. Peruse the newly created files:

         cd ./collections/mycollecton; ls -al
  
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

March 1, 2018
