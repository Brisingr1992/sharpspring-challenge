let handleSubmit = event => {
  let title = document.getElementById('note_title').value;
  let body = document.getElementById('note_body').value;

  if (!title && !body) {
    event.preventDefault();
    return false;
  }
}

const form = document.getElementById("note-form");
form.addEventListener('submit', handleSubmit);
