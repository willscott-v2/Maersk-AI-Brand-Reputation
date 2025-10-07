#!/bin/bash

echo "=== Validating Slide Consistency ==="
echo ""

# Check slides.md for slide numbering
echo "Checking slides.md slide numbering..."
SLIDE_NUMBERS=$(grep -o "## Slide [0-9A-Z]*:" slides.md | sed 's/## Slide //; s/://' | sort)
echo "Found slides: $SLIDE_NUMBERS"
echo ""

# Check for duplicate slide numbers
DUPLICATES=$(echo "$SLIDE_NUMBERS" | uniq -d)
if [ -n "$DUPLICATES" ]; then
    echo "ERROR: Duplicate slide numbers found:"
    echo "$DUPLICATES"
    exit 1
else
    echo "✓ No duplicate slide numbers"
fi
echo ""

# Count slides in markdown
MD_COUNT=$(grep -c "## Slide" slides.md)
echo "Total slides in slides.md: $MD_COUNT"

# Count slides in CSV (excluding header)
CSV_COUNT=$(($(wc -l < slides.csv) - 1))
echo "Total slides in slides.csv: $CSV_COUNT"
echo ""

# Check that new slides exist in both files
echo "Checking new slides exist in both files..."
NEW_SLIDES=("26A" "30A" "33A" "48A" "55A")
for slide in "${NEW_SLIDES[@]}"; do
    if grep -q "## Slide $slide:" slides.md && grep -q "^${slide}|" slides.csv; then
        echo "✓ Slide $slide exists in both files"
    else
        echo "ERROR: Slide $slide missing from one or both files"
        exit 1
    fi
done
echo ""

# Check markdown linting (basic)
echo "Checking markdown structure..."
if grep -q "^##[^ ]" slides.md; then
    echo "WARNING: Found header without space after ##"
else
    echo "✓ All headers properly formatted"
fi
echo ""

# Check section headers are intact
SECTIONS=("Why This Matters" "LLMs as Stakeholders" "Where LLMs Get Their Answers" "Where Should You Focus" "Examples" "What's Coming" "Let's Discuss")
echo "Checking section headers..."
for section in "${SECTIONS[@]}"; do
    if grep -q "# Section.*: $section\|# $section" slides.md; then
        echo "✓ Section '$section' found"
    else
        echo "WARNING: Section '$section' may be missing or renamed"
    fi
done
echo ""

echo "=== Validation Complete ==="
