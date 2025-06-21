use aztec::{prelude::AztecAddress, protocol_types::traits::{Deserialize, Packable, Serialize}};


#[derive(Deserialize, Eq, Packable, Serialize)]
pub struct Order {
    pub bid_amount: u128,
    pub ask_amount: u128,
    pub bid_token: AztecAddress,
    pub ask_token: AztecAddress
}

impl Order {
    pub fn new(
        bid_amount: u128,
        ask_amount: u128,
        bid_token: AztecAddress,
        ask_token: AztecAddress,
    ) -> Self {
        assert(bid_amount > 0 as u128, "ZERO_BID_AMOUNT");
        assert(ask_amount > 0 as u128, "ZERO_ASK_AMOUNT");
        assert(bid_token != ask_token, "SAME_TOKEN");

        Self { bid_amount, ask_amount, bid_token, ask_token }
    }
}
