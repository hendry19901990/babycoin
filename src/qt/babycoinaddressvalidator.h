// Copyright (c) 2011-2014 The Babycoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BABYCOIN_QT_BABYCOINADDRESSVALIDATOR_H
#define BABYCOIN_QT_BABYCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BabycoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BabycoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Babycoin address widget validator, checks for a valid babycoin address.
 */
class BabycoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BabycoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BABYCOIN_QT_BABYCOINADDRESSVALIDATOR_H
