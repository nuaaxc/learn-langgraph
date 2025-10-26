# Learn LangGraph

A learning project for building agentic AI applications using LangGraph.

## Features

- 🤖 Build stateful AI agents with LangGraph
- 🔄 State persistence and checkpointing
- 🧪 Comprehensive testing setup
- 📊 LangSmith integration for tracing
- 🛠️ Modern Python tooling (Ruff, mypy, pytest)

## Prerequisites

- Python 3.11 or higher
- OpenAI API key (or other LLM provider)
- (Optional) LangSmith API key for tracing

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/nuaaxc/learn-langgraph.git
cd learn-langgraph
```

### 2. Create and activate virtual environment

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

### 3. Install the package

For development:
```bash
pip install -e ".[dev]"
```

For basic usage:
```bash
pip install -e .
```

For specific extras:
```bash
pip install -e ".[jupyter,test]"  # Install with Jupyter and testing tools
```

### 4. Set up environment variables

```bash
cp .env.example .env
# Edit .env with your API keys
```

## Project Structure

```
learn-langgraph/
├── src/
│   └── learn_langgraph/      # Main package
├── tests/                     # Test files
├── pyproject.toml            # Project configuration
├── .env.example              # Environment variables template
└── README.md                 # This file
```

## Development

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=learn_langgraph --cov-report=html

# Run in parallel
pytest -n auto

# Run specific test markers
pytest -m "not slow"  # Skip slow tests
pytest -m integration  # Only integration tests
```

### Code Quality

```bash
# Format code
ruff format .

# Lint code
ruff check .

# Fix auto-fixable issues
ruff check --fix .

# Type checking
mypy src/
```

### Pre-commit Hooks

Install pre-commit hooks:
```bash
pre-commit install
```

## Usage

```python
from learn_langgraph import ...

# Your code here
```

## Environment Variables

Key environment variables (see `.env.example`):

- `OPENAI_API_KEY`: Your OpenAI API key
- `ANTHROPIC_API_KEY`: Your Anthropic API key (optional)
- `LANGCHAIN_TRACING_V2`: Enable LangSmith tracing (true/false)
- `LANGCHAIN_API_KEY`: Your LangSmith API key (optional)

## Resources

- [LangGraph Documentation](https://langchain-ai.github.io/langgraph/)
- [LangChain Documentation](https://python.langchain.com/)
- [LangSmith Platform](https://smith.langchain.com/)

## License

MIT
