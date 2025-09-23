*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Create Milestone Quotation
    [Documentation]    Create milestone quotation with N rounds, each defined by test data
    [Arguments]    ${title}    ${description}    ${deliverables}    ${amount}    ${date}
    milestone_quotation_page.Click Create Milestone Quotation Button
    milestone_quotation_page.Click Add Round Button
    milestone_quotation_page.Input Round Title          ${title}
    milestone_quotation_page.Input Round Description    ${description}
    milestone_quotation_page.Input Round Deliverables   ${deliverables}
    milestone_quotation_page.Input Round Amount         ${amount}
    milestone_quotation_page.Input Round Date           ${date}
    milestone_quotation_page.Click Submit Quotation Button
    milestone_quotation_page.Verify Quotation Status Should Be Pending Payment

Fill Quotation Form With Test Data
    [Documentation]    Fill milestone quotation form using test data values
    [Arguments]    ${rounds}    ${amounts}    ${total}    ${date}
    milestone_quotation_page.Click Create Milestone Quotation Button
    FOR    ${index}    IN RANGE    ${rounds}
        milestone_quotation_page.Click Add Round Button
        milestone_quotation_page.Input Round Title          Round ${index}
        milestone_quotation_page.Input Round Description    Description ${index}
        milestone_quotation_page.Input Round Deliverables   Deliverables ${index}
        ${amt}=    Get From List    ${amounts}    ${index}
        milestone_quotation_page.Input Round Amount         ${amt}
        milestone_quotation_page.Input Round Date           ${date}
    END
    milestone_quotation_page.Click Submit Quotation Button