Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010010.outbound.protection.outlook.com [52.103.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C54E573
	for <sophgo@lists.linux.dev>; Mon, 11 Aug 2025 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754877762; cv=fail; b=L9S5zrrEYX8sy9oCJRsMKiDg3MkJ4Nk4YJO3myLjMVRtFnGXZ+YJaYCpZ7QEwoyPAOOdDiJHCMNoQOrkFDsIZHP9yOkghW1BWIJbFdoRvTdg/FmsDYAwufYXruaDuoJ3SLvVOry6pvs8FnIWCyAHkRRDMNIbus81ollo4+a35YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754877762; c=relaxed/simple;
	bh=6E0kxYjJByAj3Sfac6AIU2CcmgT2iB/Jq1FaHd11j60=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=luk1U36KJ/+eVAz+CHDWsZPMjwnQnXIiKwBWinhz2Zy3WnPVqtadqmTdltddzeyCZOhY20iI1OpecOZ88VQqaJ8PjX2ms3pZkMv6YLtp25kG3xz3sBm9m/NQ7mNHLWo56VpQYG0a7ZBP0nGQBbUkxRAnZx3soSsJBZmtD8HUa/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DKUhTCXC; arc=fail smtp.client-ip=52.103.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DKUhTCXC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8LIjXJzzyO06Rb3zT5uL/Dzoa3GmU+hW8k0UVBjBTw4Ub8/1ebmVJeQFhrYZLHEvoY9jUaVFxq5zfUdCLfzIovnjFbGfakxpSJWxQ1i4nIvlpKVyJslyoMoGKmKX8YbT78IF3e6EUmdmTv6Osb2O7kt8gFEOiWuac8oNNJ0fzNZM21rWMFm7lluHEyemuPA5y0wnwPn3NBLhCqApMqYJBN2hHMT1YMso76fiPoUwIJAFrYR7vkGfDhl9A/IwHGhT/85Ci8K///NKB4JrInHzo9g7w5OpI1TLv05ayQKyS9G1T6uWKeQAQhqPGg4lRvFk1Qtm6/gBgzjbzhxC1l1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDbvuJijJnGJkNQbyfhFUlK9DAwuveDus3vN0zqhz/U=;
 b=X8VKsEuWZAKIcjzWkr+26v893itRDaObEPVW8j7TKWW/UK5lPVrKlTR6AjzOSJNU6jicLipy47gkk9Sgi3ryo0vi2j3wpJtWyLu7HLuZy6e6svwcOCAhNmj0hYLimh83EhHLa+rXcoqHtjwGtIlgrgWAlgrrmnxbVwemz/3sIgBc5pnophjGvpE6+gX2qyynUHZ52iqy1f6T5KiL1OCTm1dmlR4Ofus+D+2sODWHZzcxBpFwoHXl2FZCvBZQ0sIZpYgfdpLcQs2/c1n0nzXZd/eDfVWzYrE9kVYfINTnaixIPO/J+wJPu2ChpSreeAM5cPmF4ukvAvSZ0ltDAJxC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDbvuJijJnGJkNQbyfhFUlK9DAwuveDus3vN0zqhz/U=;
 b=DKUhTCXCUkjukWw/i6phw0CZi7zBfZWjl9ZI/3kc1Rz686LY7c9vlC1w1JHCVp0fbiEp2B5gHHN1e4Jc3t8xWAyZ4O7XnHb55PLQ7lTEL1sVBaR4bAgKlAId9siW4bSCxXw0HVCrHMe8+JL1Sgb6sGkbJZAGbquCVidyefZmMZRF/Rtu58aaAQa7WQbronFAaNjanVBi25InIHcfaH0gdloZ8uVFdUx6060w5hq+9L15zJiKCGSCOFNBMhbZn/CtAEXuaVHoa7uF1hubWo43n0QuvFGv/o0byBqJRO5N4i0mu5kkLqrifTKj2TdSL5rlPwF/4p7oZhcI2ZUT0ZXwWw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAZPR01MB6035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:68::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 02:02:36 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 02:02:36 +0000
Message-ID:
 <MAUPR01MB110722BE75578BF3B7EA0B30EFE28A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 11 Aug 2025 10:02:33 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Aug/11/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <d8873d42-ca5d-4009-a899-349d3e908b70@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAZPR01MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d4eac2-d193-4d97-c6f9-08ddd87b2433
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5062599005|6090799003|22402599018|8060799015|19110799012|461199028|5072599009|1602099012|13041999003|10035399007|40105399003|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REdFRU52RGJiWFNZcUlRc282ODF2M2N1MnRldkxIQURidjVic3pzVjBaMUVq?=
 =?utf-8?B?dWllUjJsSllUbWZGelJKbVhxdmhCejRuZk42cG84eUxsWW5IeEtwRzFpKzB3?=
 =?utf-8?B?UkU1N3phaDBOeEtUZzhZYXNuZTB6Z3ZtNXQ1Q3g4a3lrWEYzN28wd0RxWXlE?=
 =?utf-8?B?WW0yUWxjRjdHYXh1ZEo0QXZ2WEVGT1ROT0QyamlxR2k1Tkk0MlhCY2tabTdy?=
 =?utf-8?B?RjBFOHFHeUliblYrOGlMNmIxbEYyUnpJZERuN3h1Vnk4UkpNblhPTm5BSlND?=
 =?utf-8?B?TkJhL0xtRG9xTG1zaGV2bU1oRzZzY1VzWWVwc0xtTi9mVWxDSEh2cEt4czlj?=
 =?utf-8?B?Q2s5OFY2MCtnTGxld1BKTWpHS0lGV3RkRXUrbHE1MmpKTkk3UWdnNGQ1MSs5?=
 =?utf-8?B?RWwyZTRuOWtmMGJUUmY3SGVjampUNEVqbSs0azBMLzVxaDBPd01ySkFkdTZS?=
 =?utf-8?B?ZzhtYWdEOW9hV2RweWhDWmQ0NEx4QWhZSlFQQkY5M0p4R3ljcWRwTHVWdVJG?=
 =?utf-8?B?aWdOeU92d0Nmb3FJYzQ0UnpZaHYzMDdWTkhvWlV5cXdJR1ZmSmNLWDQvTXF4?=
 =?utf-8?B?WWwzMFliMFl3c3ZrUkcwRnI2TjdRUVMzSWFkZWtBWVg0VkVtWjdwaE5nWnh5?=
 =?utf-8?B?cjFmRjlZbnBjSFJScmNMTUtWZ052b2xWNWUwTWE1bVgra3pWdFQrQmNnZXZt?=
 =?utf-8?B?Q1FGcDAzT2xHcFFuRlRXdnJpR2hmb1dIVGJGTzdjZ1RKQ3J5bVRXTHhGcm0x?=
 =?utf-8?B?RFZGVHRPRlArc25waTI3S09uRThJMjdjSVRCRGl5VUh2S2gyZmgyalRYK0hE?=
 =?utf-8?B?enRFQmpwbDAzOSswTDJ2dFNzWkdWQ1VlcG1CSXF5dlZ6UG54VDVCU2l0eVNh?=
 =?utf-8?B?L2MyQ09kZlN3QUVWWll4Ty8yaEJZQjRmM0xHKytzRHlMd3k2M1dWOStiOThZ?=
 =?utf-8?B?WnFVc0o1a05GK1FKaEd6RzUwZHRTenM3b25rem9KRlo1ZlJzdEVkU0d3Rml3?=
 =?utf-8?B?TE9tWi9vN0FGWDZZTDhvUWV5MzNNNGNaU05OdnBveW5HT2swMnNnYkhrdjRR?=
 =?utf-8?B?QkR3NWVBd080OXU0czlaWTRDa3pBOTJoVzd3T2Q2Q3hBVlVocWpxeTdvOEVB?=
 =?utf-8?B?NWJxakN3Q1FCa0xCMytJQXVIUVpramlPajhHTnNtT0o0ZEl1RTkvS2Z6WWhv?=
 =?utf-8?B?Ynp4U2JiL2FFNGNXdnRYcXRlSk1aaEJuSDl5c3BnbDJEbTRGSHJ4M3l3Vmg5?=
 =?utf-8?B?YmxQVitkNm83NzF6djU1Tnp1Tm9sY1VzRkp4M2NRYUdFNGtxU1JZZGJVajFr?=
 =?utf-8?B?bk5pK0ppVDduM1Erd1Z0L21TWm9YOTR3ZU5GdFhIdXNXWTdSQXhEUDlWZFF3?=
 =?utf-8?B?ZERtSERDSVZ5M0FJekF5S2tkbXEvaFZTeXI2eWpONFRTcElzMlAya0N5aUJF?=
 =?utf-8?B?WW9nNWtVSE9yL1RSWXVhMkhaTU5lMmt0L3ZIUGVkeGhvdVdVVHB4ZkNrS0Q5?=
 =?utf-8?B?MVlwZmFaUkNjYmtpQjd2MlBOVlFXbWlnZFJYbWN0RWk1YWYrcnZPeS9sN1JL?=
 =?utf-8?B?cXpVbGprQ1FvUGdvTHdZWldVRjYydDVmRGVJWGFxVXBYc0taRjBGYXFFMFFW?=
 =?utf-8?B?QkN5bXJ0ZENySU0weWk0NEYvclhnLzkxdWRkcVlKQ3pqb1oyODlBTkw1YzhB?=
 =?utf-8?B?WUNFWFNNczd4SjZZYzBqOTMwc1E0YXRjcUZEdHB0elZWS2I3UXI2WUtJU28w?=
 =?utf-8?Q?jF1ozCdkJfU2am8A1w=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2d6NTVGbVd5eFpvQUNqZ0NYWklUOE9vN0luZGJVQlBZRVpjc3JzUUFyTUcx?=
 =?utf-8?B?M2ExT3dBblpzTVJjTnRKeWIrTlJJZXhabms5M1R2elZZVkUzTTlWTlpsV0U1?=
 =?utf-8?B?eWRvMVhTeHpYeEhRN09Obkt5dFYyUUdnWEN2ZUhYMi9EaXpvUEs4aFo0alZq?=
 =?utf-8?B?RlM2MC83c2gvcVVoOUswTHlURXdOem10NVZIaW9IVDZRSnRrNEt5a3RPZjBn?=
 =?utf-8?B?WUN4aUM5TkttLzcvR2pYbndWN2RQYVBXQTMwYjIrWlhqR2QwWVlPS3N3TlVv?=
 =?utf-8?B?ZEJEQUdCb0phK3oraWpYRjI2TE5MUFc5U0k5elYvVU1DajR4WjJ4UUFmbGhP?=
 =?utf-8?B?ejNUMTQycGpjbWhFSDZrODdWTnZTSXh3NUZwcVBWcFZTaXhrR3ZsVGtPRGR5?=
 =?utf-8?B?OUxEQkE5SnNidWhHbUduQ1JNVnMvWFlmSWJxb3NSa3B0NTJZaXVvRmwxYXBn?=
 =?utf-8?B?Mnp3Qnk4ei8zemxDZjlLSHB4QzhJYnFod2xXbzNoYVZrcnJOSkZmRHlYbDlF?=
 =?utf-8?B?T0o5dCtsa05XOXFRVFV6SjBvRDkvb1ExZytxZFFvdTNlNk5xa0lxY2c0WFhs?=
 =?utf-8?B?Q1NQbWVkS3A0ZFYvbmVMR1krUWd1QzJOT3R1eW9td1JIY1Q5WFVRZ3o5MFJF?=
 =?utf-8?B?QVd3eEVyRFNaSllkNml2dUM1UHZDelpWM21hM1Z5M3RwWkZONExwWGZUUHM4?=
 =?utf-8?B?RklTTk9oRWx3bWc3cDMzUFdRZ0xBbDZaQjZtV25yL254b3ZTU2F1VG16cExS?=
 =?utf-8?B?aXRJemlaRGNYZTFHQzRIT3J3YnpJWm1vdnVndGJEUTUxS3RWaG0rcVRwUElL?=
 =?utf-8?B?QVZndEh1YlNmeWRmRFpWZkxIcjlzWjdHMGEvTzNvR3l6VW5pUWFiaCtTTisx?=
 =?utf-8?B?cm55R2RYR28zVStCVmVYeXlJV01uWHZPekhET0RTWll5ZHlid1VGSVk3ZHox?=
 =?utf-8?B?OWVCSStuTUs5YXdtdDN2MHN4ZHEyU1pJT0ZHeDNqVVJKaTNzaXZNZEc2RkpP?=
 =?utf-8?B?R0ZZcEY1TGpsTFRwMGcxNjJLamRNRlFrOFpET0N6RDFQSjEvMzBWdmtOb24y?=
 =?utf-8?B?SmVZYXJPaWtmN3BjWEtlVlRQaWJBZmtFTDRsM2MzSUwwdi9FWkRudWI0Q2p0?=
 =?utf-8?B?d2d1WHJnQi9reTlQaW8wZ0pvS2JTVTIrVk9TdFVYTWMvbEIza3NqRXROKytI?=
 =?utf-8?B?MzRlbWdnQWdNWUV2cW81amFxY2RYTEQvSnVGeStBMnAvRFBCMmNlaE9rZnpH?=
 =?utf-8?B?TDlSd01VYnN5YndtenZWK2lLYk1oaUJEenA1Y1FDTFRIZkkyVUdQYnliRzQw?=
 =?utf-8?B?bTVrSUg3L09VTzN0bmhucS8zdzBFNmdVOU1iWnFaLzNlb2xIeDBCM2ZxWWNo?=
 =?utf-8?B?VklGcFk4d3BTQVZ3TlpjTXQvVGI3eVFMY3F0SXNWdG9XS1VaaEdoQ0lxSm4y?=
 =?utf-8?B?UU96akZ0Ykw2by9wTDFCY1hsYjBjRWRrYTlXdVl0WnU4bVVpWldUYUs1SXJv?=
 =?utf-8?B?Mk01RUdFUFpDK0NQY1YxS1hHT3VZMWNXbTdpQ2U2VkJnaVI1dUphVURQbXNs?=
 =?utf-8?B?TDBLMUZLckhsUHVNanIzOTNzdjg5ODBVRGY0a3BLY2hWODhDQXphME1lZnM4?=
 =?utf-8?B?OXhwc2w4ZWF5SWVDVXhMTlpJVS9NWHJyOTBWSzV6d01NVUl2L2l3dGhldUlV?=
 =?utf-8?B?QXQxTk1Kb2k3SWJBc1RsNHJzbzlVM2tKZUJrOFZ0dldWNDk0emcxVHVEV2FD?=
 =?utf-8?Q?saJIfvjbZISrMBqGdWVg0xKKPIIpEku0Dv4xeqz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d4eac2-d193-4d97-c6f9-08ddd87b2433
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 02:02:35.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6035

Last updated: Aug/11/2025 @https://github.com/sophgo/linux/wiki

v6.17-rc1 is released. Update the status along together.

About the content merged into this version, see [1] & [2]:

Link: 
https://lore.kernel.org/soc/MAUPR01MB1107297124C9DA0CD77DA3DC1FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM/ 
[1]
Link: 
https://lore.kernel.org/soc/MAUPR01MB11072C4B088AAC02268044E95FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM/ 
[2]

Thanks,

Chen

