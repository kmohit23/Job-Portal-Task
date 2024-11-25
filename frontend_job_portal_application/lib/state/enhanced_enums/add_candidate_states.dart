enum AddCandidateState {
  name('Add Name', 'Next'),
  email('Add Email', 'Next'),
  contact('Add Contact', 'Next'),
  jobRole('Add JobRole', 'Next'),
  education('Add Education', 'Create'),
  profileImage('Add Profile Image', 'Choose an profile image'),
  resume('Add Resume', 'Choose a your resume');

  const AddCandidateState(this.title, this.buttonLabel);
  final String title;
  final String buttonLabel;
}
