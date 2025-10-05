# Presentation Generator - Quick Start

## Setup Instructions

1. **Create Google Spreadsheet**
   - Create new Google Spreadsheet
   - Create sheet named "Slides" → Import `slides.csv`
   - Create sheet named "Config" → Import `config.csv`

2. **Add Generator Script**
   - In Google Sheets: Extensions → Apps Script
   - Delete default code
   - Copy all content from `generator.js`
   - Save (Ctrl+S or Cmd+S)
   - Refresh the spreadsheet

3. **Generate Presentation**
   - Use menu: Presentation Generator → Generate Presentation
   - Find your new presentation in Google Drive

## File Structure

```
Maersk/
├── slides.csv      # Your slide content
├── config.csv      # Presentation settings
├── generator.js    # Google Apps Script
└── README.md       # This file
```

## Customization Guide

### Adding Slides
Edit `slides.csv` to add new slides. Key columns:
- `order`: Slide sequence number
- `section_id`: S1, S2, etc. for sections
- `layout`: Title, Content, Section, TwoColumn
- `title`: Slide title
- `subtitle`: Optional subtitle
- `bullets`: Main content (use • for bullet points)
- `speaker_notes`: Presenter notes

### Layout Types
- **Title**: Opening slide
- **Section**: Section dividers
- **Content**: Standard bullet slides
- **TwoColumn**: Side-by-side content (use | to separate)

### Configuration
Edit `config.csv` to change:
- **deck_title**: Base presentation title
- **company**: Company name (will prefix title as `[Company] Title`)
- **presenter_name**: Your name
- **presentation_date**: Date of presentation
- Duration and timing settings
- Visual styling (theme colors, fonts)

**Note:** Generated presentations will be named: `[Company] Title - YYYY-MM-DD HH:mm` for easy version tracking.

## Quick Tips

1. **Use pipe (|) as delimiter** when importing CSV
2. **Keep bullets concise** - expand in speaker notes
3. **Test with few slides first** before full generation
4. **Check slide order numbers** - they control sequence

## Working with Claude

When working with Claude on this presentation:
1. Share the CSV files for content editing
2. Ask Claude to help structure your content
3. Use Claude to generate speaker notes
4. Request specific slide layouts or sections

## From SMX System

This is simplified from the SMX GEO Master Class system which includes:
- 108 slides across 4 sessions
- Workshop exercises
- Chart generation prompts
- GitHub auto-update system

Start simple, expand as needed!