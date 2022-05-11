describe("Navigation", () => {

  it("should visit root", () => {
    cy.visit('/');
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Can add products to cart", () => {
    cy.get(":nth-child(2) > div > .button_to > .btn").first().click();
    cy.get('.nav-link').contains('My Cart (1)');
  });
});