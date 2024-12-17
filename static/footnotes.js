function parseFootnotes() {
    // Function to extract unique footnotes
    function extractFootnoteDefinitions() {
      const footnoteRefs = {};
      const text = document.body.innerHTML;
      
      // First, find all unique footnote definitions
      const definitionRegex = /\[(\^[^\]]+)\]:\s*([^\n]+)/g;
      let match;
      while ((match = definitionRegex.exec(text)) !== null) {
        const key = match[1];
        const definition = match[2].trim();
        footnoteRefs[key] = definition;
      }
      
      console.log('All Footnote Definitions:', footnoteRefs);
      return footnoteRefs;
    }
  
    // Function to replace footnote references
    function replaceFootnoteReferences(footnoteRefs) {
      
        let content = document.body.innerHTML;

        content = content.replace(/\[(\^[^\]]+)\]:\s*([^\n]+)/g, '');

        // Replace each footnote reference with a superscript link
        Object.keys(footnoteRefs).forEach(key => {
        const refRegex = new RegExp(`\\[${key.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\]`, 'g');
        content = content.replace(refRegex, `<sup><a href="#footnote-${key}" id="footnote-ref-${key}">${key.slice(1)}</a></sup>`);
        });
      
        // Remove footnote definitions from the content

        // Only update innerHTML if changes were made
        if (content !== document.body.innerHTML) {
            document.body.innerHTML = content;
        }
        
        return footnoteRefs;
    }
  
    // Function to create footnotes section
    function createFootnotesSection(footnoteRefs) {
        if (Object.keys(footnoteRefs).length === 0) {
          return;
        }
      
        const footnotesContainer = document.createElement('div');
        footnotesContainer.className = 'footnotes';
        
        const notesHeading = document.createElement('h2');
        notesHeading.textContent = 'Notes';
        footnotesContainer.appendChild(notesHeading);
        
        const footnotesList = document.createElement('ol');
        
        Object.entries(footnoteRefs).forEach(([key, definition]) => {
          const listItem = document.createElement('li');
          listItem.id = `footnote-${key}`;
          listItem.innerHTML = `
            ${definition}
            <a href="#footnote-ref-${key}" class="footnote-backref">↩</a>
          `;
          
          footnotesList.appendChild(listItem);
        });
        
        footnotesContainer.appendChild(footnotesList);
        const emptyParagraphs = footnotesContainer.querySelectorAll('p:empty');
        emptyParagraphs.forEach(p => p.remove());
        
        // Find the footer and insert before it
        const footer = document.querySelector('footer');
        if (footer) {
          footer.parentNode.insertBefore(footnotesContainer, footer);
        } else {
          // Fallback to appending to body if no footer found
          document.body.appendChild(footnotesContainer);
        }
      }
  
    // Main render function
    function render() {
      const footnoteRefs = extractFootnoteDefinitions();
      replaceFootnoteReferences(footnoteRefs);
      createFootnotesSection(footnoteRefs);
    }
  
    // Run on DOM load
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', render);
    } else {
      render();
    }
  }
  
  // Automatically run the footnote parser
  document.addEventListener("DOMContentLoaded", parseFootnotes);
