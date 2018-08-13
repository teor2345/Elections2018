# Possible Vote Disclosure in ACT Elections

It might be possible to link some Australian Capital Territory (ACT) voters to
their votes in previous elections (2001-2016), if they used electronic voting.


## Background

> At the 2016 election, the Commission built upon the achievements of the 2012
> election. Of particular note was the upgrade of the electronic polling place
> management system, incorporating the networked marking of names of voters on
> electronic electoral rolls across all polling places and electronic
> transmission of results on polling night, and the provision of electronic
> voting to around 1 in 3 of all ACT voters.

Source: [Report on the ACT Legislative Assembly Election 2016], Page 1

[Report on the ACT Legislative Assembly Election 2016]: https://www.elections.act.gov.au/__data/assets/pdf_file/0016/1044016/Report-on-the-ACT-Legislative-Assembly-Election-2016.pdf "Report on the ACT Legislative Assembly Election 2016"

> 118A Approval of computer program for electronic voting and vote counting
>
> (1) Approval of computer program for electronic voting and vote counting
> The commissioner may approve 1 or more computer programs for any of the
> following:
> (a) to allow electronic voting in an election;
> ...
>
> (2) The commissioner may approve a program under subsection (1) (a) only if
> the program will—
> ...
> (d) not allow a person to find out how a particular elector cast his or her
> vote.
> ...

Source: [Electoral Act 1992 (ACT)]

[Electoral Act 1992 (ACT)]: http://www.legislation.act.gov.au/a/1992-71/current/pdf/1992-71.pdf "Electoral Act 1992 (ACT)"


## Vulnerability Summary

Two related vote disclosure vulnerabilities exist in the ACT's election
systems:

- **V1:** A voter can link another voter to their vote, if both voters voted
          around the same time, using nearby electronic voting machines
          (2001-2016 elections).

- **V2:** Elections ACT collects the order and timing of electronic votes, and
          electronic electoral roll mark-offs. Anyone who gains access to this
          data may be able to link some voters to their votes.
          (2008-2016 elections).

There is no evidence that either vulnerability has been used to reveal any
votes. However, it may be possible to take advantage of these vulnerabilities
without creating any evidence.


## Recommendation Summary

The data collected during future ACT elections should be minimised. If
particular data is not essential for conducting the election, it should not be
collected. Data minimisation ensures that no-one is capable of linking voters
to their votes, even if they have access to all the election data.

In particular, electronic systems should not collect any more data than the
paper systems they replace. Electronic electoral rolls, electronic voting, and
polling place surveillance systems should be checked to ensure that they do
not collect the timing or order of votes. Electronic voting and roll-mark off
records should be shuffled every time a vote is cast, and when groups of votes
are combined. Votes should also be shuffled before publication on the
Elections ACT website.

Details of the design and operation of of electronic electoral rolls and
electronic voting systems should be made public. Publishing these details
should improve public confidence in the ACT's election systems, and allow
election security researchers to provide advice to Elections ACT.

Electronic voting systems in other Australian jurisdictions and around the
world may also have similar vulnerabilities. Unfortunately, it is not possible
for researchers to analyse many of these systems, because their designs and
source code are not public. Other electronic voting systems should be reviewed
for similar defects.


## Timeline

- Early January 2018: Discovery and confirmation of the vulnerabilities.

- Early January 2018: Initiated contact with Elections ACT and Software
                      Improvements (electronic voting system vendor).

- 13 January 2018: Initial Disclosure to Software Improvements and via
                   Software Improvements to Elections ACT. Disclosed that the
                   vulnerabilites affect multiple vendors.

- 31 January 2018: Response from Elections ACT directing me to deal with
                   Software Improvements.

- 3 February 2018: Detailed Disclosure to Elections ACT. Repeated that the
                   vulnerabilites affect multiple vendors.

- 20 March 2018: Elections ACT agrees to public disclosure on 9 April 2018.

- 27 March 2018: Detailed Response from Elections ACT.

- 10 April 2018: Elections ACT declines to participate in public disclosure.

- 10 April 2018: Request to Elections ACT for revised disclosure timeframe.

- 13 August 2018: Public disclosure of vulnerability, to allow time for changes
                  to be made before the [next ACT election in 2020].

[next ACT election in 2020]: https://www.elections.act.gov.au/elections_and_voting/2020_legislative_assembly_election "2020 Legislative Assembly election"


## Detailed Recommendations

To address these vulnerabilities, Elections ACT should:

- **R1:** Randomise the order of all individual ballot paper preference data
          from electronic votes in previous elections. This data is already
          publicly available online, in vote order.
          For example: [2016 detailed vote data]
          (**V1**, **V2**)

- **R2:** Remove any details in electronic voting records that could reveal
          vote order or vote timing. In particular, remove the vote timestamps
          and sequential vote ids collected by the current eVACS (electronic
          voting and counting) system. Then randomise the storage order of the
          votes. See also the [electoral paper disposal legislation].
          (**V2**)

- **R3:** Remove any details in electronic roll marking records that could
          reveal roll mark timing or order. Remove any fields similar to
          those listed in **R2**, and randomise the order of the records.
          (**V2**)

- **R4:** Ensure that future electronic voting systems do not collect any more
          vote information than a paper voting system. In particular, do not
          collect any fields similar to those listed in **R2**. To emulate the
          behaviour of paper votes in a ballot box, randomise the order of the
          votes when adding a vote, when combining groups of votes, and
          before publishing votes.
          (**V1**, **V2**)

- **R5:** Ensure that future electoral roll marking systems do not collect any
          more information than a paper electoral roll. In particular, do not
          collect any fields similar to those listed in **R2**. To emulate the
          behaviour of marking off voters on paper, randomise the order of
          marked-off voters when each elector is marked off, and when combining
          groups of electors.
          (**V2**)

- **R6:** The [2001 audit] focused on the correctness of the eVACS system.
          Future voting system audits and reviews should take a systems
          approach, rather than focusing on individual pieces of software, or
          isolated sets of data. It is unclear whether there was an audit of
          electronic electoral roll marking. When new technologies are
          adopted, audits should be updated, and new reviews conducted.
          (**V1**, **V2**)

- **R7:** Publicise enough information about the detailed design of future
          ACT voting systems that scrutineers, researchers, and other
          interested members of the public can verify their security.
          Designs should include publicly available source code, like the
          [eVACS source code]; and publicly available detailed design
          documents.
          (**V1**, **V2**)

[2016 detailed vote data]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/ballot-paper-preference-data-2016-election "Individual Vote Preference Data for the 2016 ACT Election"

[electoral paper disposal legislation]: http://www.legislation.act.gov.au/a/1992-71/current/pdf/1992-71.pdf "Electoral ACT 1992, 335 Storage and destruction of electoral papers"

[2001 audit]: https://www.elections.act.gov.au/elections_and_voting/electronic_voting_and_counting/development_of_the_system "Development of the system: Auditing"

[eVACS source code]: https://www.elections.act.gov.au/elections_and_voting/electronic_voting_and_counting "eVACS Source Code, 2001-2016"


## Detailed Vulnerability Analysis


### **V1:** A Nearby Voter Can Discover Other Voters' Votes

*A voter can link another voter to their vote, if both voters voted around the
same time, using nearby electronic voting machines (2001-2016 elections).*

A voter can create a unique vote, then submit that vote immediately after a
nearby voter's vote. When the detailed vote preference data is released by
Elections ACT, the voter can look up their unique vote, then find the
preferences immediately after it in vote order.

When there are only two electronic voters in a polling place, one of those
voters can use **V1** with a high degree of confidence. See
"Average Vote Gap" for details.

It may also be possible for a non-voting observer to identify the first or
last voter at each polling place, then link them to the first or last vote
cast at that polling place.


#### Creating A Unique Vote

All paper and electronic votes for the 2001-2016 elections are available
online (for example: [2016 detailed vote data]). If a voter chooses an unusual
arrangement of preferences, they can link their vote to a vote in the publicly
available record. It is possible to choose unusual preferences without
affecting which candidates are elected by a ballot.

In the 2016 election, 5 members of the Legislative Assembly were elected from
each of the 5 ACT electorates. But each electorate had between 24 and 33
[candidates]. Therefore, each voter has at least 19 preference choices that
will not affect the outcome of the election. The number of possible
combinations of these irrelevant preferences is:

```
    19! = 121,645,100,408,832,000
```

The number of voters in each ACT electorate in the [2016 election] was:

```
    48,238 to 52,500
```

Therefore, any unusual preference combination is very likely to be unique.
(The analysis is similar for the 2001-2012 elections.)

[candidates]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/list-of-candidates "2016 ACT Election Candidates"

[2016 election]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/2016-election-results/results-overview "2016 ACT Election Results"


#### Identifying Vote Order

All paper and electronic votes for the 2001-2016 elections are available
online (for example: [2016 detailed vote data]). Each [ballot paper record]
contains:
- pindex: a unique, sequential identifier for the vote
- batch: the polling place batch number, which is linked to the:
  - electorate, and
  - polling place
- details of the voter's preference for each candidate.

Elections ACT has confirmed that the electronic vote order in the public vote
data matches the vote order in the polling place.

Other details of these fields can also be determined from the
[2016 eVACS source code]. For example, vote ids in the \*_confirmed_vote
tables are allocated sequentially by \*_confirmed_id_seq. (See
evacs/setup_election/setup_phase1.sh)

If the pindex field is a sequential id, it also reveals the order of electronic
votes. (It does not reveal the order of paper votes, because paper vote order
is not preserved in the ballot box, or during counting.)

The publicly available vote data lets anyone discover the order of electronic
votes in a polling place. Therefore, any electronic voter can determine the
votes of those who voted around them in the polling place, if the voter's vote
is unique.

The vote order data also makes it possible for anyone to discover the first and
last votes in a polling place. It may also be possible to discover the first
and last votes *in each batch* at each polling place, if batches rotate on a
predictable schedule.

[ballot paper record]: https://www.elections.act.gov.au/__data/assets/file/0003/1002639/DataDescriptions.pdf "2016 ACT Election Data Descriptions"

[2016 eVACS source code]: https://www.elections.act.gov.au/__data/assets/file/0010/988687/evacs2016.zip "Source code for 2016 eVACS software"


#### Identifying Voter Order without Voting

Polling place locations and opening dates are publicly available. Therefore,
it is relatively easy to observe the first and last voters voting for each
electorate at a polling place. Therefore, a non-voting observer can identify
two votes per polling place, with reasonable certainty.

If batch numbers change on a predictable schedule (for example, every day, or
after a certain number of votes), then more voters can be linked to their
votes. It would then be possible to observe the first and last voters in every
batch, for every polling place, and every electorate.

Once a few voters have entered a polling place, it becomes harder to work out:
- the exact order in which people voted,
- if they actually voted or not,
- whether they voted on paper or electronically.

This polling order uncertainty makes it hard to link votes and voters outside
the first few and last few votes, per polling place, electorate, and possibly
per batch.


#### Reducing Vote To Voter Uncertainty

The vote to voter uncertainty can be reduced if an adversary only cares about
the first major party preferenced in each vote. If a small group of
simultaneous votes all preference the same major party, then it is very likely
that those voters all voted for that party.


#### Further Questions

Public information about Elections ACT's systems exists, but parts of it are
incomplete. In the interests of accuracy, I asked Elections ACT and Software
Improvements to clarify:

- the exact process used to produce public detailed preference data. The code
  that exports public vote records doesn't seem to be in the
  [2016 eVACS source code], or there appears to be some post-processing of the
  data.

- if batch numbers change on a predictable schedule.

- if the batch numbers in the public vote records as the same as the batch
  numbers that are collected. The public batch numbers don't seem to match
  the format in the eVACS source code or [ballot paper record] descriptions.

As of 13 August 2018, I have not received a response to these questions.


### **V2:** Elections ACT Can Link Voters To Votes Using Order Or Timing

*Elections ACT collects the order and timing of electronic votes, and
electronic electoral roll mark-offs. Anyone who gains access to this data may
be able to link some of voters to their votes.
(2008-2016 elections).*

Elections ACT can compare the timing of electronic roll mark-offs and
electronic votes. If there are a small number of voters in the polling place
at any time, these voters can be linked with their votes with a reasonable
degree of accuracy.

It may also be possible to use vote order and roll mark-off order to link
voters to their votes, with decreased accuracy.


#### Identifying Vote Times

The time of each electronic vote in the 2001-2016 elections is stored by
eVACS, to the nearest second. (The [2016 eVACS source code] implements these
timestamps in evacs/voting_server/save_and_verify.c and evacs/common/evacs.c.)

The eVACS system collects precise timing of each vote, along with all the
preferences in that vote. Access to this data is restricted to a few Elections
ACT staff, and the data is destroyed a few months after the election. But it
could be possible for someone to gain unauthorised access to it.


#### Identifying Polling Times

The time that each voter was marked off the electronic electoral roll was
collected in the 2008-2016 elections. Each election appears to have used
a different system, the latest system is described in the
[Report on the ACT Legislative Assembly Election 2016]. (The 2001 and 2004
elections used paper electoral rolls.)

Elections ACT does not provide many public details about electronic electoral
rolls. However, they have confirmed privately that timestamps are collected
when the roll is marked off electronically. Elections ACT de-identifies
electronic roll records. However, they also disclosed that roll timestamps are
kept to investigate voter fraud. Therefore, this de-identification must be
reversible.


#### Identifying Polling Order

Elections ACT does not provide many public details about electronic electoral
rolls. However, as timestamps are kept when roll is marked off electronically,
it seems likely that polling order is also stored in the system.


#### Average Vote Gap

If a voter is the only voter in a polling place from the time their name is
marked off the electronic roll, to the time they cast their electronic vote,
then they can be linked to that vote with a high degree of certainty.

If there are multiple voters, then it becomes harder to link each voter to
their exact preferences. However, it may still be possible to identify the
first major party preferenced by each voter.
(See "Reducing Vote To Voter Uncertainty".)

When there are only two electronic voters in a polling place, one of those
voters can use **V1** with a high degree of confidence. See
"Average Vote Gap" for details.


##### Polling Hours

In 2016, polling was open:

Pre-Polling from 27 September to 14 October:
- 14 Days
- 9am to 5pm (8pm on Friday 14 October)
- 6 polling places with electronic voting
- References: [2016 Pre-poll voting]

Polling Day (ordinary votes) on 15 October 2016:
- 8am to 6pm
- 6 polling places with electronic voting
- References: [2016 Election timetable], [2016 Election statistics]

Therefore, pre-poll electronic voting was open for 115 hours, and polling day
electronic voting was open for 10 hours, at each of 6 polling places.

[2016 Election timetable]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/2016-election-timetable "2016 Election timetable"

[2016 Pre-poll voting]: https://www.elections.act.gov.au/elections_and_voting/past_act_legislative_assembly_elections/2016-election/2016-pre-poll-voting "2016 Pre-poll voting"

[2016 Election statistics]: https://www.elections.act.gov.au/__data/assets/pdf_file/0004/1035580/Stats-book-2016.pdf "Election statistics: ACT Legislative Assembly election 2016"


##### Electronic Roll-Mark Offs

(These calculations are conservative, because they use the largest ACT
electorates. Smaller electorates make it easier to link voters to their votes.)

The ACT electorate with the largest number of voters in the
[2016 Election statistics] (Table 3.1) is Yerrabi, with:

```
52,500 voters
```

In 2016, pre-poll and ordinary voters were marked off the electoral roll
electronically. The number of pre-poll and ordinary Yerrabi voters who voted
in the Gungahlin polling place was:

```
12251 pre-poll Gungahlin voters
 2311 ordinary Gungahlin voters
```


##### Electronic Roll-Mark Off Gaps

Electronic vote times are kept to the nearest second. Assuming that electronic
roll times are also kept to the nearest second, the average gap between roll
mark-offs in Gungahlin was:

```
115 pre-poll hours * 3600 seconds per hour / 12251 pre-poll Gungahlin voters =
  34 seconds between roll mark-offs during pre-poll voting

10 ordinary hours * 3600 seconds per hour / 2311 ordinary Gungahlin voters =
  16 seconds between roll mark-offs on polling day
```

Since the average gap is 16 or 34 seconds, actual voter gaps during quiet
periods could be several minutes. If it takes a few minutes for a voter to
vote electronically, then voters who vote during quiet periods can be linked
to their votes using these timestamps, with a reasonable degree of certainty.

It may also be possible to use vote order and roll mark-off order to link
voters to their votes, with decreased accuracy. (But see also
"Reducing Vote To Voter Uncertainty.")


## Acknowledgements

I want to thank the staff of Elections ACT and Software Improvements for their
assistance in disclosing and analysing these vulnerabilities.

It would not have been possible to discover **V2** without access to the eVACS
software source code. I want to express my appreciation to Elections ACT and
Software Improvements for choosing to make the code public so that people can
review it.

I appreciate the assistance of Dr Vanessa Teague, Dr Chris Culnane, Dr Alwen
Tiu, Dr Thoms Haines, and Dr Benjamin Turnbull in preparing this analysis, and
during the disclosure process.


## Author

T Wilson-Brown, Independent Security Researcher, August 2018
(they/them pronouns)
