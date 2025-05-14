Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010000.outbound.protection.outlook.com [52.103.68.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B174C7C
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206619; cv=fail; b=T6Cz1t1ofoUrBMfU2r/EkShFOK5KnqRs49g9UCXMjOWLz5fJgPvRmkAxv6QG5bnjeWX94MJ1vl+/f7PPG9wwrWf3aJzHbCCpm/Wzna+cvEF/7Uj5NIIl4kRRYKbznLWlSvEXhj2YdsytgH/xkRvieT4wc1103m1OCi1lzu78vQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206619; c=relaxed/simple;
	bh=/aWq1XE4azPAMQIYIK37ix0jy6kVAfOUp1OeBwiTe44=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=mDHP4kNJuF3wLOtwixVFsE60StB3hXm+CKJbuNs8SLGglBXZGWU7EwBxLYDo1jSe11fviVtS8nofzP8lVOjujnSE2PdoHQfFhbA6IdnoBfnanWrHuoXadcl+moeK6c9jYutwqAMB48Bs61HDibQwRgLpKabgQ+kvBOzaJps5dbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YREsCKJ7; arc=fail smtp.client-ip=52.103.68.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YREsCKJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5W9s1hwLdJxT8KVd3RJHhwPVqi06IJj7T76fw+79FylrZjqY8yJG8xsWLz8WqIdff/ode49rgK6IcUVOWdf1dGSTP06CV1VFoEspqCK45k0ekPeY0EWTwHaFZ++fi1AgwMAYXH2KLSTRo9+LATVSOBNn2meI4xibhW131fVDuq7dWwgVqiTGOosAq2UKCGpsrxEI/icitMBnikPQv7sDtqyWwf/xr6M9zUJyICG2kIC0/z48ui4+J4zuNr/8OlmU8ho2bF8iN6A+Niw7dalzUKOTwRlMU8HHJPjbCuf2yMt37OxWxNjGei8eP9xVyinUNj9dmcYjpktLr2X/cHMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMkMzNeU563vrDtYTX+m0w5hzb8OaIuDLxNCD5BTXdo=;
 b=UvOPg5R6ISy/6476DdNnnsPh/fABO1Qg5bklPf+/SDiQT3l6nicuGanUBi2S9o0m6Hic6MJzxIv6XzAJOGf8kyI+dsX5zUiBSinqpeMLvMsBrAr0+e4kM4A0Jq9Lkj+4ehp3P/gF9s9YVSkn81mSL95OTlMGRv4azc8WPdp77DQpuKPwyBaPe/2BEmAwJTmys5cLF4uW4m8FRJoZ/vXz8bdaYlCjf9Sv/8t6up4eH0aZrX9wVCAZnHv2EfM+KCaqniV012r1/YIT3UjK7A5IDCc62yCVFRx5mgH6S11p5KVKszT9+lpsPxw9PnCA7f6Hn1j59HSmCsFD4nvSvWEW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMkMzNeU563vrDtYTX+m0w5hzb8OaIuDLxNCD5BTXdo=;
 b=YREsCKJ7YD1KY/09CGg46YgzvhwNTOvR1louUCls4cSVqI7sZ5ZfKKoRYKImSir6pqqgBOkBbTsrn9XSrzq0RVFrmzAD8ldeALb/Xe0q3vMbXJe9nMzHI+l5zPJLwHOT6TvKQmwaUZFmrTuNzhKkTIPfYD+nQ7kSNbl+ReXdfZwcM7kimhMWKZ1owTjVHQ6FtG5I1dXPfiCIlonnKGPyEDL21V/DvyTzlZWOBwUqVyB2YKeBc5nEPsUyDSOllK+udC1FMmlsdmuGPtvxUmHanFH8GopCazDGS84EQrdLlvVFwFVuYIUFzeosq+WNu5YgRw4UOOY3Vs9CFsRDz14QpA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1812.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 07:10:13 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:10:12 +0000
Message-ID:
 <MA0P287MB22621CFD972701BFFD51C29AFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 14 May 2025 15:10:09 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki updated: May/14/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <152e550c-c4d6-4435-aef4-0ad7d7036327@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1812:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aeecf5-5e6f-4e9f-6a8c-08dd92b65e54
X-MS-Exchange-SLBlob-MailProps:
	KW6s2gPZH1dzm1VGkT6pM7tyH8w6y9teZ7CBQoyEI81+IR+/HRhwla4pEypII9fnQj4QUpvPJaVuSSLsz97+ucWNvQbi0XVnds3GQpBbMEoY6s9G2mltmxAUIVVg9XCfVmKeQSE3gDSYZvdgcXzM+7Nh0qEeqtEy83NTDg2PP2DPkmjxiHOiTT6If2zkUeQ7h66T7kcOSjAXoHJjl7e7p2fNJuRJSumzk4Z8qmYh1xfXWKzHY1NzRPaH32qR3vbC7FlZBnAF2eF7Lhrh1WDFxRiT2n2m+hpi78kozHRuij+9oQ7NZFWSg60oNDIvbAmJYik88Nd7xxv02luAvjDqqYCRBSVyP0tUU8/l91tXliFzH1Jqdppp60SZUTPy4FUlUD9E+2S7EvtuskgSu9aCLtWQDzPiDX5B/EP6ITjbJsTSgWmWonxPAdjyb3oMvxDDnBo4lATbbe3jvGiP0CVYYknS4ukR3ZYov8M1hYSmBHXHEF2+xPpsUgotQBAlzoYvIhSnCigWN+EQ7GunHoSjxtVRVq4TV4jhkGW/wvfpnqgeVjJIW8X7mRQ0kb1d1ZKLP4eD7KbmeeCcMIGii6hEEZKIKQPDW9ERPWmDyEHsUMappgTA0L/JCtbwW7fAycGgMN3meX7A9D20dFZldVK+ZbITt0kpkk/L8vxv/kC3qUDei0bFLLKl++EEsX8gC9OPP73PAYD9XZb4bxe9KTYVWr63URd2ud871kXJiZOfgG0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|22402599018|461199028|6090799003|19110799006|7092599006|15080799009|8060799009|3412199025|440099028|10035399007|4302099013|34005399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFRDOFBLU1VJSElpL1RJTDhZNHZtanN6ZzBaTzkvVEIwQ0xxVnZ3NnlKVGcw?=
 =?utf-8?B?QXZock1CaFg2NFNHc2gvVTlUWllYRGVqeVVDSDRxOVBrMEdEbmpzSUQrTnl5?=
 =?utf-8?B?NDl2ZnBhUlhGajM3RVhDdWhqcWJJY3hiM3V5MnZDaEhrMkVncERKeEpDMHhp?=
 =?utf-8?B?OWswSTN1M3B3NitHWkQ2WFI5MTg0Y3JPVTJZVnVtOE8weDBaL2xUWFE5aU0x?=
 =?utf-8?B?U0RNbklvbVpKRWMvR3ZESE9jdy9tNmIzUlV0Y2FlTUhKMjNEZUR3S0ZJeW9w?=
 =?utf-8?B?ZEwwa1IyRER6eUx3YUF5TnlOcS9IeXgwV0Iyd3h5MTJDMUs3ZTBWYkFGaWFL?=
 =?utf-8?B?eS8yamc5WlFYM2lKc242aStpc1ZkVy9NbUMvdWY1VE16czNIbFdEMTZOZ0Nt?=
 =?utf-8?B?NkJPbjgwTHdKOVFJVFRMN1FTWExGWjVsRlJoZzBmdnZrbnBnanpSV2Zzempt?=
 =?utf-8?B?MXUyejlvZXJLbWx6WlpkVmFkVWk5S0tDQloyeXdwZWsrT1VodTVGc0ZDVG5s?=
 =?utf-8?B?VXR1VGtUYnI5ZTQ4VWJ1Yk4xNnR4VEFZZTliMkFGUmFRVWFKbzRkcEI0c01j?=
 =?utf-8?B?TlFuTTg5U01udkRQN2U4SUdaYkRyc1UySUxmUE9QdW5TaGRpNWNGZkh4cklF?=
 =?utf-8?B?TmFhdEl6ZlJoTUpnWUFzQ2xFeHhsck1sNVZHNGs1bENIQkx5Ujg0ZklaYzlq?=
 =?utf-8?B?RENMWDZJVUYwR2xRNVQrY2NLU3JKUkFBOHRVanNQcTRldyt0eHc0R1RPU2hZ?=
 =?utf-8?B?Z3JNcHB0eHlzWFBUUlJselFpT3ozOU5JYWRPaVNCN3NscjV5RU4zWXRySHU1?=
 =?utf-8?B?TW44djlQRmdPZmR6bXQvdHFkSmdZalJuQVNpdzlXdWxiTWxMN0ltc3ZzaFRJ?=
 =?utf-8?B?UHJEZ01LUiszdXIycTJ6WjVqZXp0OVFqY3NnamE3d0NPcERnTDZYTTduQzRp?=
 =?utf-8?B?am52cjA2VW9nQjg3S0gvNHM1Q2E2cVk3WHA5dFpVT0RrVmt6MVFvT3VLRFJo?=
 =?utf-8?B?K1hQQ0pSK0xJa0lKTTk0TzFnNGtFaUQvakFFc1lLa0RySVI5Vi81VzBmcFh3?=
 =?utf-8?B?N0RQVEJxdUxTTkxyYTcwSytTL0RBRGNPS2cyV0FaaHVIakp1a0QweU1jb080?=
 =?utf-8?B?L2YyeEVkY0dta25oQ2JlVlQxN1EvVWNTM0sxMU5ESG44ZmhQVTk2ZFZFRlNT?=
 =?utf-8?B?WU95OTlPMG9idytCMkt1Y0l6aHEvT0VxYWJWdWdncVQ3TU9CUDlMNUI0dXJH?=
 =?utf-8?B?MVRuK2xqSnBMR0FrcE83Wm9KdnBBUXE4SFMrczNzL3dZQmQ5cjhpK3pYZUcv?=
 =?utf-8?B?d1BLR3RUNmQzbFFmQ0Z2c3g1SkdDV01zYW04emp2bTg5c0pnMDIxSEkxU2xu?=
 =?utf-8?B?bS9YeVlhOEhIS1E3NW83RkxobjM3SXdXYnRNNFhRVnlBcURSMzZYdjFLNHpm?=
 =?utf-8?B?elAxcHVJNVhoWDdYTnZBNG1sUHM3ZDRHZ1FBZTk4bUZVWk92aHFPRS91TnN2?=
 =?utf-8?B?aUF2WUJTcjN4SGpMcGVlaE1DaUFacS96VDdoRnJGRzRhaG9wNjFIMWJnZngv?=
 =?utf-8?B?d3Y4eVhENVdHRTQwdTkxRS96UHYxZk43d1VmR3hhd3NrV0tnNk5zbUF2YTZh?=
 =?utf-8?B?NE9GTEVQcXhRa3VtVVBpTWFuUzFubE9ISmtvYnd6YVJXV2hFbHZzKzU4YWNq?=
 =?utf-8?B?eHY0VVVsWmJsbkd1b01yT1VKL3JDWW0vbGh2QWlXaTkrZWREZTRCRzU3N3ZK?=
 =?utf-8?Q?cyKoo7YF1MFPSCgMag=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VStWMnFKWmg1clo3Y0NTc2JYWVZvMGRIS3YzTlBTMFExRFV0TnQ1YURiSkJE?=
 =?utf-8?B?TE5ndW83K1VlMWpWVnI0WHV4cXltK1BxeUh1bm41TkdWTnphM3FDSk5qelcx?=
 =?utf-8?B?SHdXTkRYYzNqa1J2NXp2ZUpRM3FUdlRsNGFncWVHZW93WitRcG9OSlhhUzZQ?=
 =?utf-8?B?ODB6cHAvOVhCaU9lWEwxekhQWHdWaXNJdEN6R1VtekxEbmpJaHBpbGprckR4?=
 =?utf-8?B?cDNuZHk4UVlUYW9wWTN2T0NONWhqUnZVaGYrNEYyNXFkVEpQNjZENzhTWnA2?=
 =?utf-8?B?all6QUF5NGMzcTd5dHc4cUZXeUFienViak1tQndleVluK3loVHNRUDlNMzVj?=
 =?utf-8?B?aEZjNlJvcHBpU2VlRjVpT2hETkdheTR0a0JJR1NxM0h6b01lVkhSRVVVd3lh?=
 =?utf-8?B?NGlxNG5kTko4eWpwY00yL1VyWFk4NmllSnMwMVRXSmo0UWlvS1JuOHZJQ0Q1?=
 =?utf-8?B?eFlyNWYySU51Tndza2d2QStqUEpyT1ZmU0YzWHdWQ0Fnb1ZKTWZGUldPSTRq?=
 =?utf-8?B?dlEzTTlmdS9xcTVNUDdBSFhKTUsvSDVJcVJlQllKNzN3WCtnd20wdHlzaDBX?=
 =?utf-8?B?QjJSZGo4b3I1THFCVkFWbVF5ZkFNTklXWGxNcmNuUzdsaENwZHJ2RHBHbHdG?=
 =?utf-8?B?Nnl4WEpxOEtPc1drenBoL1ZNUEZlNGhJWVRsZVhidkRqSlJBdVF0VllSNmJh?=
 =?utf-8?B?VlZmOFUwbjJmc0QvVURHMzlHRHNnYmNxdGJSQVp6TWI2UkxQTDZIczF4bXY5?=
 =?utf-8?B?Q29aS0x5UVBYeE5NaGxIWnRYRzg5ajdDakVwUnBIdGxpUmpmZm8vTXEvc1JG?=
 =?utf-8?B?bFFMQlZjQTJkOC9kcG9aQW5NYUlMNnpidytvbFpOOXJYTG02S0F4bG5Pak5F?=
 =?utf-8?B?OXZSWVdZajlYOUtGN0NhNjFOR3ZEWmdRaWl1WXhxQVhWaDZkQkpzenQ1UXg4?=
 =?utf-8?B?YkgrdzVLR0Q3UWVXT1lqUVFCbUxUVWlTOWJjTUR0TjNoQ2pJL3Q1RjlRSytP?=
 =?utf-8?B?MHcyT3ZyS2RCdW5wV2hDaFRnM1Jab1VVRld2M0ppTm9XbUVLa2xzS1lJMVpG?=
 =?utf-8?B?TU1LWnRnUThJc0hvNWJYYmlvYkkycS9TSlNFNDN2alpoWHJCTU5veit3bWV1?=
 =?utf-8?B?d1VuZkZRNHRYNzZOandBM3F4S0dpU2l0OE9tdndNaVRYdWs3b2VsK0xDU1FQ?=
 =?utf-8?B?RE8vL0F4M2F6ekNlMFVmS2gxMjI3azRxRHM4VzNsaU5qRjQvNE5FSEpYOHZa?=
 =?utf-8?B?WGFrOU96T2kzK1hsZVl3YlVnRmNmTi9pNXFlZENQZWxtSGI3WWtVZXgvalNl?=
 =?utf-8?B?YjIvcXJtajVDbGlZOTlRZE1WUzZvR2hJM0pNSVBTcUVwV2wra3FJQktJMlRT?=
 =?utf-8?B?YVRLMGhRRFNWNnlBVE43MlJRaUFWdGtSQ3RCZURIZ0I1NDVDSlVZNjIvZ0Z3?=
 =?utf-8?B?dm5Lcm56YTFNMzlhWFh0Rmh4MC9EbFpEbnEwSlRzYVp6aDVBemZHMWFOMnZL?=
 =?utf-8?B?T1lGcXFhU291QjRqejZUN1VZUDJqeE1FWWVaZFFkZVEvUUxMTnNnSGRWc29o?=
 =?utf-8?B?djEwQy9ReWpreFM4M21sYkFtc3loSVhlQzlPdWc5WDVaQ3ZNOFZzTUhzaGhm?=
 =?utf-8?B?NUMyaEdkakxKaWdWTUN3c0lmVXpQYVpGZHNxTit2MXZ4d1FWRzMxOEFWVGp2?=
 =?utf-8?B?dU14NHVUYWVnMVFYM1lqTFRZMTJyam9Pa3dwaEJUR3BoU3oyUHBIdXNVcFZO?=
 =?utf-8?Q?g+3uri03If67LQIvMU77ddeIJw+aZVAVjuQaRjz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aeecf5-5e6f-4e9f-6a8c-08dd92b65e54
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:10:12.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1812

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/dfa5cc1ab93758090d99427cee4a3dbb41177164...428db3f6635e4d215566a4bf302116766b2ccdeb

We have got RTCSYS(CV18xx),  DTS rework(CV18xx), and SRD3-10 board 
support(SG2044) ready for next v6.16.

We are getting new board SG2042_EVB_V1.0 & SG2042_EVB_V2.0 support recently.

Well done and thanks,

Chen

