Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011029.outbound.protection.outlook.com [52.103.67.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABD12E7F
	for <sophgo@lists.linux.dev>; Thu, 15 May 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353436; cv=fail; b=oMHYFMUTkQyAJLMq97QyeQ/RTcx/cqCrULvQf0iKImUPSKemvowide30Ji2CExpWxoHL+x5CMbEPxH9Eq/5bjJyQV/FlU8JeV7bzlL6rMQODH9aIsKyyM7/4rzuvMpJfww6esZNbU/E2rQtRwDDYG13EEu7XlKtUCp6M5UDlDbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353436; c=relaxed/simple;
	bh=nwItjZdunHo44sq00q06qXy2eGHgDx6kGVeUkt85Ujk=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=toOxBjl9Q2Qk1nZLPKc3aWCx/FoO5MnD733QkYY9DA6Rl15b8RFRecbueYfVnWOx+Ev6FyUEiN0UkrlovaesqP5S2XhNjXFsMbB76NB+T6tdeM7i1hGHYGdS5Z1IP/HWYC5CL2EjNdIQRBHS441XCiEiURovyT4kdnilEK4YHVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nxEb5ylM; arc=fail smtp.client-ip=52.103.67.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nxEb5ylM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBe98MPM8IMfcYfzbIi0QR1IgCh+utHZazkXB/OCQvE/hBX7GsnJPWzG0QSv+dnJ6vNcumTq4FsSEcxaDezlB4ti6PI2Rw6yQ3H0/qkYBu6DcAReIelJG3LRt2YtH0uIkC+1CUfzaqLCkZIVnbnHtyik9Ong3ssADTX8/4V5YEsrGX+AIilCqceVF5F8WquMpU8vvYQchGpxO0yR+zZrxi3IvmO11CWaD8YXlIAF9FJVFssO2Bd7JSudlkR27V88fn2+d4Mh3Qc0jd0UVDsshhApCGdGW+O2t5jaCGwVHvAXBV2HSQ/ZEueOkqBPDGHGmvCRA425tRdx486tFVsdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEcwrwLIpfTkU0MzNFNIT1IKZf1ZgzP56uR46AkhEk4=;
 b=SV3TIPKjDR8Q1XNlik2D2fKBLzW1ZRxWM+E4FMiU6EH+MVFzTkQrBhi3AzSzEGPIkW9NGBQio/5zAkjbthTe+q2JSUDR6IR28tAST42Jk6WbcqlSDJuwBMwAvN6n2mQS6AXnHQj9HcSRw1cVpCpY7BS93A3WPcRunRUkZcxYG12yBG1fKB63TK8SLDX7AgORH7LQKhIdlLfvqwJdP2yF174ab2tGYawH9OBlypLpw9tX4kOotovnhne0CkVIUKh0bYb/lef/LPj96AXu0goKI+w6Bv8YBrig1aLYYCcmGfwv6C80kVt9vwKKoBFd05p5HJ/3p7y0H6QZWLH9I8RztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEcwrwLIpfTkU0MzNFNIT1IKZf1ZgzP56uR46AkhEk4=;
 b=nxEb5ylMupgPw68qujBVSyL7JvxCZapTjNor0DXzXdPl9sNEVjml3fytd69nX2nBUdmoQ7sAkZYvjkMe4CYwajj/8D/27akgA2bgGxEidU6n7cvDzNUs4wAqdF+iV1Cf1Z45XVBzqMmQoPm9XIUbDPIuCx4Fdx6TyWOop4iosHaVJgSrZBf7IIlV8j/Up+Xy3gQWdxMp2B52W7sanAS1XMmjTzGL6L7qL8VBbn2Ih+WENeCYrTyOVASxaxkwwDb5fGidyY6f0xqJFNaDUMEUBlsQDvNqniYyYJwICYwtnc9bU4SvZZ5RpPJvhQA3j++MPM1nqIjN65EZWa3DOcnz0w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB1357.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 23:57:10 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 23:57:09 +0000
Message-ID:
 <MA0P287MB2262B8BC9AB4A6AFDCA7C653FE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 16 May 2025 07:56:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Contributing to sg200x mainlining
To: Thomas Bamelis <thomas@bamelis.dev>
References: <ptdz1WJOLt9yiRV2xnF5ghdnF8Eyxb8nxLMbf6oqo-kSOitDPZ8D5ZDCs3GIpFa2Q_zNNB4IPOEboILjgY8fTyo12jlUeT1y1A6VgUTpxLQ=@bamelis.dev>
Cc: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ptdz1WJOLt9yiRV2xnF5ghdnF8Eyxb8nxLMbf6oqo-kSOitDPZ8D5ZDCs3GIpFa2Q_zNNB4IPOEboILjgY8fTyo12jlUeT1y1A6VgUTpxLQ=@bamelis.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <fcad6c07-fc0a-423f-953b-88b720b3e9e4@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB1357:EE_
X-MS-Office365-Filtering-Correlation-Id: c16d4691-0f4b-463c-ab5b-08dd940c3220
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|6090799003|8022599003|19110799006|15080799009|8060799009|7092599006|56899033|1602099012|440099028|4302099013|3412199025|34005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2NMM2FpYjl4bnR6OXFSR1VjZXJBWkRydm5HUmNJZGd4YjBVMXRCSEJvTVBL?=
 =?utf-8?B?QXpZUDQ0SnY0OXd1RHJ0eXNqZkdBZmNCMzJ1Sm9uWExySEFZb0VSNWpOdUJE?=
 =?utf-8?B?UHVlWVY0dFhja1B6eWZURmQ2WHlFc1ZyWEdwUDl4RW5KblBpcHdIN01HMS8y?=
 =?utf-8?B?bzkxU04veEtlT0FldmptM0tuVWRvY0F0ZnhXRkl5ZDVFQmVsUkU1LzhBemlF?=
 =?utf-8?B?VWsvcUQzZzJWeWNWTVhFVXQ0T0ZLa1BOR2NGUGxFdG5ILzFpSHFURy81ZFBK?=
 =?utf-8?B?UFZzZ1BaQnY5M2xVZm83MlkyakhyaTc4M0VMNjRxYkRiU2g2a1ZkcmhzZDdD?=
 =?utf-8?B?Q0F2Qk1lZGlvUm53MTZzcTNnd2V2Mjdvdis3NVJHenFQeWZ3MU1VRWR3ZEli?=
 =?utf-8?B?cHMyYkFrOEZzMURaQlVGMWpSNDlDQkJWODQxaWlZN0lRYmlNVXIwVnluYXlU?=
 =?utf-8?B?dWVYeUdjdnFWMTZYTjBLRTNwMEdwVFNVTVVpMS96cGZJSjRaVU1tM29nd1FD?=
 =?utf-8?B?WjQxZHhUWmFRV1NwdVQyczNaUWhISy9VS0RNQVdURHE1ODNjdDFOWFVROWlt?=
 =?utf-8?B?K0NnV2hqSGZtRXlHMHpET0xmU2lmY25WMzc0SUhnM0xUaXlnL1czN0pISWx5?=
 =?utf-8?B?SC9WSFdxTlpmd0NMRjlSRFJHTllZeTJjWUljRWd0cHRFYVM4YWFLRzUzYzM0?=
 =?utf-8?B?dUhCNWhoc3VMWFlxd0NnTk1xcjRpZ1hWM2dTVzRyd05HaXpVZG81ajl0clhZ?=
 =?utf-8?B?VTUwZlJUMVlMcGhHUDk3NlB2Zms5Nll1TXk0a1FnWGRuTVEzRUNPamtoRERV?=
 =?utf-8?B?QWd2NVVhblp6QktxN1RnN3VPbHdwWlU0dnE5MHNPK1BZOTEralk1Zmp6dDdL?=
 =?utf-8?B?SzFRRjBJSGUvd3lCbFZaelB6MlgyTjNFOEhYNjRiUFlNcnZyUkV6SXA2bUVu?=
 =?utf-8?B?cGFCQTlPRFlKYmlyTFdYZDFLRWlncFlMZ0lxWjBpUHRibCtEaU1LcDRwaWQv?=
 =?utf-8?B?V0ZnMEVINlV4emdod2EwK0RyR0MyR3d2TlJydXM5YUl2QkRNVnZuMjRVMnZj?=
 =?utf-8?B?SlFNN0d2ZnBMb3JjejlFa2dmQzhMQWRheTIyRXVja2REWFpiYXNlVmNtc2Vz?=
 =?utf-8?B?TzBVMUlkN2x3Y1l1aVdPZ2RlMFhzaUp0VHJYT1cwbXQ1VDc1L09qcGszUy9B?=
 =?utf-8?B?ZlFlYWdwMXh1czFBQUlyVUNSeUxFbW1KV2ZqNENXQlBCK0JLYkdINWVVODJI?=
 =?utf-8?B?dWtISmRNazhIT0VFMU84K0Q1YU15MVdxb1grQnl6S2FwNFh1cUhLN002cG5Q?=
 =?utf-8?B?ZkU2SjdhUk1IQ1U3NnhndUNTNGFsNjBSb01lVmp4bGt1S1lNYjBuNm1GUmo5?=
 =?utf-8?B?ZHZzQm9oQzIzY2ZWS2RGc05DaWZCbzBvUUhhblZDbWdXWGt3cFhVVXdldjFM?=
 =?utf-8?B?dVEzbHRDMkdweGxKZ0ZFSjZ4aG5oaGtLdlM1TVJpVkMwNHRtMC9oc25LNDd0?=
 =?utf-8?B?cWdaeTJVSTB2SlhqaENtR25URzJWWm81WDhsVXdXVFZBMUJUaWhRckxSQVBP?=
 =?utf-8?B?VGNpVWh3aUxmVE9uai9TTVp1SzNQNWcxa1Fldk1vVXlmOVVxaE5QSk1qdWJU?=
 =?utf-8?B?bDJmZUtqaGp0T2drKzkwN0hZcTl6LzFKZndmV3hqcTIxRnh3QWhrUzhKanlX?=
 =?utf-8?B?KzhMbVdCeGwvQXJuSFZ6U0krbWNxeTJHeTl5N2x3V3VtWmJISXNVTXFhUEJ6?=
 =?utf-8?Q?WDC00CcUE5qozqwOPXTCnS4LlaCHLAdXKQ5u0MB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXlibnlJQTg4N1dXUXllTzd4Z3EvamhRT25yMkFSMmdtVGNDWEFsVG85VWlB?=
 =?utf-8?B?eDh4bDFTaFU0a0F3QmxhSVVLTU1IdC85c3NVSE8veXdIZld4MHBaTTV2c2do?=
 =?utf-8?B?M2Z3anlielVKNnUrNERlN3p1RXRmT3dxb0swWHZ5L25JcmVWN2dyL1ZPNXNs?=
 =?utf-8?B?ZEV3TnB2b2FEQ0FJMEo5Y1Zlald6Y0xVcUppMUNtZnZNOU8wTXhHK0ljZGVM?=
 =?utf-8?B?UlgzWHppeSt1WTBZbEc5eUZ6TWNDSUVWNitGZjRsbHhEaGY0UjYvcWhuRUZk?=
 =?utf-8?B?WWczM05QUXZ6Ym5BeWRBVTBSaEtudlN4TnAwYlp4V3B2MlZ5Y1BFR3JqODE5?=
 =?utf-8?B?Zi9xUjhNb2wvRkhaZU9ZUmV5Mlk4QXl4VlI5Nk1XTENoQUhTRjNCc3doME1o?=
 =?utf-8?B?WEIyN2N3dUpTVDY0SVAxZFRMUG9aWlFYeTF4T2dKS3JrRzMrRlpXU2lNOWZG?=
 =?utf-8?B?K2poOTBuNFM1WmdaRU1kb3RYdFNiVlYxaUpVb1IvaElub0JUL2lKNXBqUVlH?=
 =?utf-8?B?UzBVdVh2bUNKWll2VnBMMDd5SlhjckRRcGN6elZPK2RNdmUwVzhJd3RmSVJD?=
 =?utf-8?B?WkYwNjVZQzIweFUrcjEvbXNBMlhKY3RKTExjMW9ZeVlZZ0NkSlBpSkxOUU00?=
 =?utf-8?B?aHg0ZU53Mng5MjdpRTBYQ0xOdkNTcXNYd1Vqek5kZ0xsRkR6OEVMQklya041?=
 =?utf-8?B?elZjUkZySklxcTZlQXQ3c25YbnYyQnJXM0RaTmpuUTk1cTJjdEExckIrVDlh?=
 =?utf-8?B?eDFQY3NZa0hFa0JSMFpYWXNtdjA0WDlRUUIzQko2cjFqZVNqT0ErdnZNVUNN?=
 =?utf-8?B?RHB4cDM1ZzlOVTh0Q2Nic2JjdkVJcGxZaUhYTDk2OVpvZ3JGUTNZRmNlb1FU?=
 =?utf-8?B?OGNxWGV5UktNS1dLczlzdjhHanBNY0ozdWpXbTRBUFNrTjhwU3dtODY3Z2d4?=
 =?utf-8?B?dlRnajBWWTR3TWdIVDROenBKVFpwUUhXRXN2RXd5NnpwVE9tOG5sby94ZzY4?=
 =?utf-8?B?MVJFaUZhNFdLNzh6RHlrWUhLamJ4V3ZqaUpzZC9HN3I3N3lnV21UNjhJalJB?=
 =?utf-8?B?SkYzSXBoTFh2YWQ5eDFETWFhWThFZFJlcU1nbitGcVBlTjVFTDNvVjBwZW4v?=
 =?utf-8?B?K3ZOeXFLRkJUUUFNR21tQzgvYkhVUWNjMXAzc3JpQnVrbXVVa1FzS2IySlkv?=
 =?utf-8?B?Qlo1bFY1eEtXdG80aytxMFAxRC9WM05ubFV4VTdYUTROYUFMdUJLRUlBSDRB?=
 =?utf-8?B?elNzUEt3RFE3ZlBVbElGdWJBUDBSQVQwL1hUZmtoSVcxajZPalo4LzdUTXlB?=
 =?utf-8?B?Ym4reGVtUGlueEVTSnArT3FPdTg4MjR0MGplMU85MUQ2bjZpWkhyVGJtb1gw?=
 =?utf-8?B?cGVMcjlxaWl5TzRZeEY3VG5pbk9nUnVRVllkQUNpcExKcTlQa2Vlc25rdFU3?=
 =?utf-8?B?RHY1dzZlaHZya2xrV2ErTy91eXBhMzBkQ2VZdTBXRmRGNldoNExvMDJRWFNm?=
 =?utf-8?B?bi9JQWVOTjNQcTVURHo2djJkcGk0UUo3SDY3UXE1a3ozWDlHQWxnYnBIbzdG?=
 =?utf-8?B?SHE3WE5TWlVoNzZMYmVGbDRQZzFwQmx2ZWcvbTYzOExJdmYxTTM3d3dYeFh3?=
 =?utf-8?B?bytLYjZQcmxVeS9lMXhsU1dtQmx5WlFWNVpvb05HOXlzMFF6a3hoL1pyYW5l?=
 =?utf-8?B?ZHcvQ3FlQkxFcjBUclJTOXlLVUZYTHRod2thQmVsR2VwNTFNUjZUQmROZGYv?=
 =?utf-8?Q?pjsh9rU9i1bKXPdVqxRsSjGL3iHMj84szz2BjzU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16d4691-0f4b-463c-ab5b-08dd940c3220
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 23:57:09.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1357

Hello, Thomas,

First of all, welcome to join us.

I'm not sure if you know that we have a wiki page: 
"https://github.com/sophgo/linux/wiki", you can use it to learn about 
the upstream dynamics of sophgo related products, including SG200x 
(belonging to the CV18XX Series). Read the information on the wiki page 
carefully, I believe it will help you understand the work of sophgo 
linux upstream.

We also have a maillist specifically for sophgo: 
"sophgo@lists.linux.dev". If you have any questions about linux 
development and upstreaming for sophgo products, you can send an email 
to it or directly send an email to the linux community mailing list. 
There are always enthusiastic people in the community who will help you. 
When you submit related patches, you should also send a copy 
to "sophgo@lists.linux.dev".

Regarding DuoS and the work on the arm chip on it, Alexander and Inochi 
are planning to refactor the cv18xx code to add support for arm cores 
(originally only riscv cores were considered)

For other technical information about sg200x, you can take a look at 
"https://github.com/sophgo/linux/wiki/Resources". Thanks to sophgo and 
milkv for open-sourcing this information.

So, don't hesitate, start contributing, everyone started this way.

Adding Inochi, he has made the most contributions to the cv18xx series 
and is currently the main maintainer of the cv18xx series.

Looping sophgo mailing list, maybe others can provide more suggestions 
and help.

By the way, if you want to submit a patch for a product module, but find 
that someone else has already submitted it (for example, based on the 
information maintained on the wiki page), it is best to confirm with the 
relevant personnel by email first to avoid conflicts.

Yours,

Chen


On 2025/5/15 23:15, Thomas Bamelis wrote:
> Hi Chen,
>
> I recently stumbled on the sg200x chips and bought some.
> I would like to contribute to mainlining it.
>
> I previously worked at Cisco bringing up PCBs and writing some Linux 
> drivers, and now work at Arm.
> I am still quite junior (Master's in CS with 4 years of experience) 
> and have a lot to learn. I have one commit in the Linux kernel at this 
> time (a small comment).
>
> Is there anything I can help with?
> I see the Duo S is inactive and I would be interested in picking that 
> back up.
> I would also like to help bring up the Arm image and any work required 
> for the MIPI.
> I am not fully experienced, so if I can help anywhere, you can point 
> me to the docs on the matter and give me a guideline.
>
> I am sorry if this is not the intended medium to start contributing; 
> this would be my first serious venture into contributing to open 
> source, and I am still somewhat unfamiliar with the etiquette.
>
> Kind regards,
> Thomas Bamelis
