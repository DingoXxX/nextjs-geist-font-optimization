const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
  if (req.url === '/download') {
    const filePath = path.join(__dirname, 'project.zip');
    const stat = fs.statSync(filePath);

    res.writeHead(200, {
      'Content-Type': 'application/zip',
      'Content-Length': stat.size,
      'Content-Disposition': 'attachment; filename=project.zip'
    });

    const readStream = fs.createReadStream(filePath);
    readStream.pipe(res);
  } else {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(`
      <!DOCTYPE html>
      <html>
        <head>
          <title>Download Project</title>
          <style>
            body {
              font-family: system-ui, -apple-system, sans-serif;
              display: flex;
              justify-content: center;
              align-items: center;
              height: 100vh;
              margin: 0;
              background-color: #f5f5f5;
            }
            .container {
              text-align: center;
              padding: 2rem;
              background: white;
              border-radius: 8px;
              box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .download-btn {
              display: inline-block;
              padding: 12px 24px;
              background-color: #0070f3;
              color: white;
              text-decoration: none;
              border-radius: 5px;
              font-weight: 500;
              transition: background-color 0.2s;
            }
            .download-btn:hover {
              background-color: #0051cc;
            }
          </style>
        </head>
        <body>
          <div class="container">
            <h1>Project Download</h1>
            <p>Click the button below to download the project files</p>
            <a href="/download" class="download-btn">Download Project</a>
          </div>
        </body>
      </html>
    `);
  }
});

server.listen(7777, () => {
  console.log('Server running at http://localhost:7777');
});
