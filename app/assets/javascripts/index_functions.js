document.getElementById('search-button').addEventListener('click', function() {
    var searchQuery = document.getElementById('search-input').value;
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/tickets/search?query=' + encodeURIComponent(searchQuery), true);
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onload = function() {
      if (xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        if (response.length > 0) {
          updateTicketList(response);
        } else {
          displayNoTicketsMessage();
        }
      } else {
        console.error('Request failed. Status: ' + xhr.status);
      }
    };
    xhr.send();
  });
  
    function updateTicketList(response) {
      var ticketList = document.querySelector('.ticket-cards');
      ticketList.innerHTML = '';
      
      response.forEach(function(ticket) {
        var ticketCard = document.createElement('div');
        ticketCard.classList.add('ticket-card');
        
        var titleElement = document.createElement('h4');
        titleElement.classList.add('ticket-title');
        titleElement.textContent = ticket.title;
        ticketCard.appendChild(titleElement);
        
        var stateBadge = document.createElement('sup');
        stateBadge.classList.add('badge', 'rounded-pill');
        if (ticket.state === 'open') {
          stateBadge.classList.add('red-nice');
          stateBadge.textContent = 'Open';
        } else if (ticket.state === 'closed') {
          stateBadge.classList.add('green-nice');
          stateBadge.textContent = 'Closed';
        } else if (ticket.state === 'reopened') {
          stateBadge.classList.add('yellow-nice');
          stateBadge.textContent = 'Reopened';
        }
        ticketCard.appendChild(stateBadge);
        
        var priorityBadge = document.createElement('sup');
        priorityBadge.classList.add('badge', 'rounded-pill', 'priority');
        if (ticket.priority === 1) {
          priorityBadge.classList.add('red-nice');
          priorityBadge.textContent = 'Prioridad Alta';
        } else if (ticket.priority === 2) {
          priorityBadge.classList.add('yellow-nice');
          priorityBadge.textContent = 'Prioridad Media';
        } else if (ticket.priority === 3) {
          priorityBadge.classList.add('green-nice');
          priorityBadge.textContent = 'Prioridad Baja';
        }
        ticketCard.appendChild(priorityBadge);
        
        var creationDateElement = document.createElement('div');
        creationDateElement.classList.add('date-info');
        var creationDateIcon = document.createElement('span');
        creationDateIcon.classList.add('icon', 'me-1');
        creationDateIcon.innerHTML = '<i class="far fa-calendar-alt"></i>';
        var creationDateText = document.createElement('p');
        creationDateText.classList.add('ticket-details');
        creationDateText.textContent = 'Creation Date: ' + ticket.creation_date;
        creationDateElement.appendChild(creationDateIcon);
        creationDateElement.appendChild(creationDateText);
        ticketCard.appendChild(creationDateElement);
        
        if (ticket.resolution_date) {
          var resolutionDateElement = document.createElement('div');
          resolutionDateElement.classList.add('date-info');
          var resolutionDateIcon = document.createElement('span');
          resolutionDateIcon.classList.add('icon', 'me-1');
          resolutionDateIcon.innerHTML = '<i class="far fa-calendar-check"></i>';
          var resolutionDateText = document.createElement('p');
          resolutionDateText.classList.add('ticket-details');
          resolutionDateText.textContent = 'Resolution Date: ' + ticket.resolution_date;
          resolutionDateElement.appendChild(resolutionDateIcon);
          resolutionDateElement.appendChild(resolutionDateText);
          ticketCard.appendChild(resolutionDateElement);
        }
        
        var descriptionElement = document.createElement('p');
        descriptionElement.classList.add('ticket-details');
        descriptionElement.textContent = ticket.description;
        ticketCard.appendChild(descriptionElement);
        
        var viewTicketLink = document.createElement('a');
        viewTicketLink.classList.add('btn', 'btn-primary');
        viewTicketLink.href = '/tickets/' + ticket.id;
        viewTicketLink.textContent = 'Ver ticket';
        ticketCard.appendChild(viewTicketLink);
        
        ticketList.appendChild(ticketCard);
      });
    }
    function displayNoTicketsMessage() {
      var ticketList = document.querySelector('.ticket-cards');
      ticketList.innerHTML = '<p>No tickets found.</p>';
    }
    
    function toggleDropdown() {
      var dropdownContent = document.getElementById('dropdownContent');
      dropdownContent.classList.toggle('show');
    }
    
    function sortByCreationDateAsc() {
      var ticketList = document.querySelector('.ticket-cards');
      var tickets = Array.from(ticketList.children);
    
      tickets.sort(function(a, b) {
        var dateA = new Date(a.querySelector('.ticket-details').textContent.replace('Creation Date: ', ''));
        var dateB = new Date(b.querySelector('.ticket-details').textContent.replace('Creation Date: ', ''));
        
        return dateA - dateB;
      });
    
      tickets.forEach(function(ticket) {
        ticketList.appendChild(ticket);
      });
    
      toggleDropdown();
    }
    
    function sortByCreationDateDesc() {
      var ticketList = document.querySelector('.ticket-cards');
      var tickets = Array.from(ticketList.children);
    
      tickets.sort(function(a, b) {
        var dateA = new Date(a.querySelector('.ticket-details').textContent.replace('Creation Date: ', ''));
        var dateB = new Date(b.querySelector('.ticket-details').textContent.replace('Creation Date: ', ''));
        
        return dateB - dateA;
      });
    
      tickets.forEach(function(ticket) {
        ticketList.appendChild(ticket);
      });
    
      toggleDropdown();
    }

    function sortByPriority() {
      var ticketList = document.querySelector('.ticket-cards');
      var tickets = Array.from(ticketList.children);
    
      tickets.sort(function(a, b) {
        var priorityA = getPriorityValue(a);
        var priorityB = getPriorityValue(b);
        
        return priorityA - priorityB;
      });

      tickets.forEach(function(ticket) {
        ticketList.appendChild(ticket);
      });
    
      toggleDropdown();
    }
    
    function getPriorityValue(ticket) {
      var priorityElement = ticket.querySelector('.priority');
      var priorityText = priorityElement.textContent.trim();
      
      if (priorityText === "High Priority") {
        return 1;
      } else if (priorityText === "Medium Priority") {
        return 2;
      } else if (priorityText === "Low Priority") {
        return 3;
      } else {
        return 0;
      }
    }
    
    
    