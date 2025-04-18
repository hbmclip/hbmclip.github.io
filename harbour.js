document.addEventListener("DOMContentLoaded", function () {
  const keywords = [
    "FUNCTION", "RETURN", "IF", "ELSE", "ENDIF",
    "FOR", "NEXT", "DO WHILE", "ENDDO", "WHILE", "END",
    "LOCAL", "PRIVATE", "PUBLIC", "STATIC", "PROCEDURE"
  ];

  document.querySelectorAll('.harbour').forEach(el => {
    let code = el.textContent;

    code = code.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

    code = code.replace(/\/\/.*/g, match => `<span class="comment">${match}</span>`);
    code = code.replace(/"([^"]*)"/g, match => `<span class="string">${match}</span>`);
    keywords.forEach(kw => {
      const regex = new RegExp(`\\b${kw}\\b`, 'g');
      code = code.replace(regex, `<span class="keyword">${kw}</span>`);
    });
    code = code.replace(/\b\d+(\.\d+)?\b/g, match => `<span class="number">${match}</span>`);

    el.innerHTML = code;
  });
});
