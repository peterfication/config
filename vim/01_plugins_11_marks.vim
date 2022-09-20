lua << EOF
require('marks').setup {}
EOF

command! DeleteAllMarks delm! | delm A-Z0-9
