
import random
import time
adjectives          = [line.strip() for line in open("pullsh/adjectives.txt")]
animals             = [line.strip() for line in open("pullsh/animals.txt")]
funky_descriptors   = [line.strip() for line in open("pullsh/funky.txt")]

# Open the file and create a file object
# file = open("funky.txt")

# try:
#     # Process the file contents
#     funky_descriptors = [line.strip() for line in file]
# finally:
#     # Ensure the file is closed, even if an error occurs
#     file.close()


def generate_commit_name():

    funky = random.choice(funky_descriptors)
    adjective = random.choice(adjectives)
    animal = random.choice(animals)

    unix_time = int(time.time())
    
    return f"{funky}-{adjective}-{animal}_{unix_time}"

if __name__ == "__main__":
    print (generate_commit_name())