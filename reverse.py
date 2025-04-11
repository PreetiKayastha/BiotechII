## Original dna sequence
dna_seq = 'GACGTCGCCAGAGAggcataTAACGATAtgacacagagagagcaGAGACAAGT'

# Convert sequence to uppercase for uniformity
dna_seq = dna_seq.upper()

# Create a dictionary for complements
complement = {
    'A': 'T',
    'T': 'A',
    'G': 'C',
    'C': 'G'
}

# Generate the complement sequence
complement_seq = ''.join([complement[base] for base in dna_seq])

# Reverse the complement sequence
reverse_complement = complement_seq[::-1]

# Print results
print("Original DNA sequence:        ", dna_seq)
print("Reverse complement sequence:  ", reverse_complement)
