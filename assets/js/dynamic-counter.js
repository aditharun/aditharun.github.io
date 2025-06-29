// Dynamic counter management for publication lists
document.addEventListener('DOMContentLoaded', function() {
    // Function to update counter for a given list
    function updateListCounter(listClass, counterName) {
        const list = document.querySelector('.' + listClass);
        if (list) {
            const items = list.querySelectorAll('.publication-item');
            const count = items.length;
            // Set counter-reset to count + 1 so minimum number is 1
            list.style.counterReset = counterName + ' ' + (count + 1);
        }
    }
    
    // Update counters for all publication lists
    updateListCounter('publication-list', 'publication-counter');
    updateListCounter('poster-list', 'poster-counter');
    updateListCounter('news-list', 'news-counter');
}); 