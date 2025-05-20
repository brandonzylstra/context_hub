# Seed data for preference categories and questions

# Clear existing preference data
puts "Clearing existing preference data..."
PreferenceQuestion.delete_all
PreferenceCategory.delete_all

# Create categories
puts "Creating preference categories..."

# Coding Style category
coding_style = PreferenceCategory.create!(
  name: "Coding Style",
  description: "Your code formatting and style preferences that tools can respect when generating code",
  active: true
)

# Development Environment category
dev_env = PreferenceCategory.create!(
  name: "Development Environment",
  description: "Information about your local development environment setup",
  active: true
)

# Shell Configuration category
shell_config = PreferenceCategory.create!(
  name: "Shell Configuration",
  description: "Your shell preferences and configuration",
  active: true
)

# Project Defaults category
project_defaults = PreferenceCategory.create!(
  name: "Project Defaults",
  description: "Default settings to apply to new projects",
  active: true
)

puts "Creating preference questions..."

# Coding Style questions
coding_style.preference_questions.create!([
  {
    key: "indentation_type",
    label: "Indentation Type",
    description: "Do you prefer spaces or tabs for indentation?",
    question_type: "radio",
    options: ["spaces", "tabs"].to_json,
    default_value: "spaces",
    required: true,
    position: 1
  },
  {
    key: "indentation_size",
    label: "Indentation Size",
    description: "How many spaces per indentation level?",
    question_type: "select",
    options: ["2", "3", "4", "8"].to_json,
    default_value: "2",
    required: true,
    position: 2
  },
  {
    key: "line_length",
    label: "Maximum Line Length",
    description: "Maximum characters per line in your code",
    question_type: "number",
    default_value: "80",
    required: false,
    position: 3
  },
  {
    key: "trailing_commas",
    label: "Trailing Commas",
    description: "Do you prefer trailing commas in arrays and hashes?",
    question_type: "boolean",
    default_value: "true",
    required: false,
    position: 4
  },
  {
    key: "quotes_style",
    label: "Quotes Style",
    description: "Do you prefer single or double quotes?",
    question_type: "radio",
    options: ["single", "double"].to_json,
    default_value: "single",
    required: false,
    position: 5
  },
  {
    key: "end_of_line",
    label: "End of Line",
    description: "Preferred line ending style",
    question_type: "select",
    options: ["LF", "CRLF"].to_json,
    default_value: "LF",
    required: false,
    position: 6
  }
])

# Development Environment questions
dev_env.preference_questions.create!([
  {
    key: "operating_system",
    label: "Operating System",
    description: "What operating system do you primarily use?",
    question_type: "select",
    options: ["macOS", "Linux", "Windows", "WSL"].to_json,
    default_value: "macOS",
    required: true,
    position: 1
  },
  {
    key: "code_editor",
    label: "Code Editor",
    description: "What's your primary code editor or IDE?",
    question_type: "select",
    options: ["VS Code", "Zed", "Vim", "Emacs", "RubyMine", "Sublime Text", "Other"].to_json,
    default_value: "VS Code",
    required: false,
    position: 2
  },
  {
    key: "database_port",
    label: "Default Database Port",
    description: "What port do you typically use for your database?",
    question_type: "number",
    default_value: "5432",
    required: false,
    position: 3
  },
  {
    key: "development_port",
    label: "Default Development Server Port",
    description: "What port do you typically use for development servers?",
    question_type: "number",
    default_value: "3000",
    required: false,
    position: 4
  },
  {
    key: "installed_languages",
    label: "Installed Programming Languages",
    description: "Which programming languages do you have installed?",
    question_type: "checkbox",
    options: ["Ruby", "Python", "JavaScript/Node.js", "TypeScript", "Go", "Rust", "Java", "PHP", "C#", "C/C++"].to_json,
    default_value: ["Ruby", "JavaScript/Node.js"].to_json,
    required: false,
    position: 5
  }
])

# Shell Configuration questions
shell_config.preference_questions.create!([
  {
    key: "shell_type",
    label: "Default Shell",
    description: "What shell do you primarily use?",
    question_type: "select",
    options: ["bash", "zsh", "fish", "PowerShell", "cmd", "other"].to_json,
    default_value: "zsh",
    required: true,
    position: 1
  },
  {
    key: "shell_config_path",
    label: "Shell Config File Path",
    description: "Path to your shell configuration file",
    question_type: "file_path",
    default_value: "~/.zshrc",
    required: false,
    position: 2
  },
  {
    key: "preferred_terminal",
    label: "Preferred Terminal",
    description: "What terminal application do you prefer?",
    question_type: "text",
    default_value: "Terminal.app",
    required: false,
    position: 3
  }
])

# Project Defaults questions
project_defaults.preference_questions.create!([
  {
    key: "license_type",
    label: "Default License",
    description: "What license do you prefer for new projects?",
    question_type: "select",
    options: ["MIT", "GPL", "Apache 2.0", "BSD", "None"].to_json,
    default_value: "MIT",
    required: false,
    position: 1
  },
  {
    key: "testing_framework",
    label: "Preferred Testing Framework",
    description: "Which testing framework do you prefer?",
    question_type: "select",
    options: ["RSpec", "Minitest", "Test::Unit", "Jest", "Cypress", "Other"].to_json,
    default_value: "RSpec",
    required: false,
    position: 2
  },
  {
    key: "css_framework",
    label: "Preferred CSS Framework",
    description: "Which CSS framework do you typically use?",
    question_type: "select",
    options: ["Tailwind CSS", "Bootstrap", "Bulma", "None", "Other"].to_json,
    default_value: "Tailwind CSS",
    required: false,
    position: 3
  },
  {
    key: "js_framework",
    label: "Preferred JavaScript Framework",
    description: "Which JavaScript framework do you typically use?",
    question_type: "select",
    options: ["None", "React", "Vue.js", "Angular", "Svelte", "Stimulus", "jQuery", "Other"].to_json,
    default_value: "Stimulus",
    required: false,
    position: 4
  },
  {
    key: "git_ignore_items",
    label: "Common .gitignore items",
    description: "Common items to include in .gitignore files",
    question_type: "textarea",
    default_value: ".DS_Store\n.env\n.env.*\nnode_modules/\n/log\n/tmp\n/public/assets",
    required: false,
    position: 5
  }
])

puts "Preference seed data created successfully!"