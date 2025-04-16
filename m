Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010012.outbound.protection.outlook.com [52.103.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E46F1367
	for <sophgo@lists.linux.dev>; Wed, 16 Apr 2025 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762343; cv=fail; b=NFb9GuvWU4uule2sa/JwNbParUO4UiAxVidHl9SBBbnQGozfe6em3gNVVrfqJIS6e7tWBLaLiMxG9r96WlH501QEHAcXEMCoFc1It8KJaFY3Ricx75PVD1B/9OruAZRctQu7/wIn/SbJiL/5frFYHoGtvoj+au1IUBEDtTvaUwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762343; c=relaxed/simple;
	bh=kNeF72B8E4orJlu4vvYeRhAiLllgu5ONCW1V2WHWDQA=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=BBmxiQ/j4vXlH0ZXlnU+MLUTuSk3MH7YZ2Z0yh8wfldlURbKj2by1C2pJEh8TotwYQg4Y5uvBL4olmvluvGBfUhrFh9C70/se4kZoWwr2tqCZOuxZ6++hONf5WxXFKKQ9KmGokoAglBgeffES9OY+d6QelyZY3IxLLvGnpHG4dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rj8BODA3; arc=fail smtp.client-ip=52.103.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rj8BODA3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbjj0iAFPzb3UHtoKGqe0psV/OY/X1ONvdnjW2KtPPaszrzVS6kMQ0RwoohF3JV4QDU0Ndr1Mjhw3CeI5QmMfT75QzXpafjnmAxCHBbJRIXfuNrfsWWkkeoS8nbgUL/+Tz3WYwoSsWDzWBJxCT/yqGLiNnLRsYm4/FaO04XmKIrHv3eV2ud4+qmPRu2pEgGwt91UC61wgPxYwHD7Vewki1U/+6upnX2y/7cTevs737g31xcTk7qmTQkJX96/aM314hIVGKlx4I0soOfg2cWfue9VKk3CzcGIjioZiI17CLPREv1+2gLy54ePqh2esOR9nP7viPQN0WG64qKS5kk++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7y+ycyJ1z0zyPd8znfqZ+VBE0Rz0QM+rOH8FL3qmvw=;
 b=hwZ/mPRNdaR/ENXAqi09AIG0clu2HJoz9RVqZDpC+kbq/ITaDhogRmxvjCKz+UYxasprC0Kz9Db0XpotS2mh/Zfid9I35M2FZszayTNh3C9Vjdw2YglIRE8k+ns3bgHcvJs9ui64jvrl0BnYx1Z45zczUu9jlprF+w1XskkaCF3Bb4EFtiDWEEacdJnKZPg/o1sol3KpJHYs2ScwpIy7oKaqudmDWHxISF2JwCZ2WRuo2QGd1C5tqCq2821yoh5tyv9LTdzA39r70RrF++Gwx5PBPzbhoXkmgp5FXYBdP6HzEeYkNbfTMcWcv8T90wOmkLxX5jxKrAAYdiErTjQN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7y+ycyJ1z0zyPd8znfqZ+VBE0Rz0QM+rOH8FL3qmvw=;
 b=rj8BODA3jOtDdyaTEY6CxvISD7ePSE/8La2AfS8iYTe/yxgPweSsa+9rD/nAt6HgDzvig+T/GFAdmtLFTqdJ3KM/QmD8e+9tgse7camltWgbrnKKpaMN0tE4ST8EMh4u3qbRmmSMXv57N6F3QUYURxVfHWd82U2+mpBlNwLWXKc+Tj3OHZg+1g8Ps/884gQUkfki5tJOrZIVU5NZGpT4h8fJtL9f+1UEXHm+RWZ9NdJS1QP+vGuESQJts971EYpMav2X/uC7sLiWPBxmhQxvw5WhYbvCQ/RqXcxl5Pt/uhJtErnfvG9BGCGO0mrha9nUxLdVQzJhK2u+uzsitrYY3w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0142.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 00:12:15 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 00:12:15 +0000
Message-ID:
 <MA0P287MB226218FD4F48EE7C3DBE0636FEBD2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 16 Apr 2025 08:12:06 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
Subject: https://github.com/sophgo/linux/wiki is updated Apr/16/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <0f0b797b-d3b4-4051-8dd7-38e732ea94ba@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0142:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6ec4ec-a8b6-48cd-a0ed-08dd7c7b55db
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|7092599003|19110799003|15080799006|8022599003|5072599009|6090799003|5062599005|22402599018|461199028|1602099012|440099028|10035399004|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDJ5YzRFZHo4MFFNVitqbFZjM2prUkJYNzZNdFNyOTF3WFcrcWkwTTFyVXor?=
 =?utf-8?B?YkYwM3JpNlcrbjlJc0dKcTRyZUVib3ZvYnhya0Y2M0xGajlXREhRbXBmU0R3?=
 =?utf-8?B?cXNTU05WNmRkU0xWTnZkNWY1OGVWWGNZaEt6MVdVRXJoc1BVU1FSMldZZ0hO?=
 =?utf-8?B?bWNkdEwwMjhtbmxWNkp0blVMS1BZbkh3UWQ4L3hXWEtvNWVrNzY2dUFwcVRl?=
 =?utf-8?B?RFJHV2J1eFpCd3NxQVNQN2d4Wmw2d2F1SFVZT0N4ZFhHRCtOOE9vNXNuWit6?=
 =?utf-8?B?L0c0ZW00cG54MVo1WlNWRFJ3U2orcHRlaXB4OStJSUxXY0owcDhzNkI5ZGpN?=
 =?utf-8?B?V2lUOFJDN2htVWxaRnB4a0FpWmZSM3BsaWhRb0U1MklKMm12OEc1TXhreFd4?=
 =?utf-8?B?Z05JK3dUZHV3MUhVTHh6S0pseGpIRG4xa3VjcDcvNTEvazJPMUdsdmF4ckt6?=
 =?utf-8?B?TFl3KzRHQTN3WUtTWWpoUmJMWnhQVXFqbkk4M2tFWHRrdlZFTk14aW9ycDFu?=
 =?utf-8?B?N1k2U1BNa3RoZTJzSDNqV3RmVmNwYjFJVmZGZkszNFAyTkVZVytUbDZoWWts?=
 =?utf-8?B?MEZMZFVyei9EUUVHREI0ODZSN0tzQk9BNyt2STFuYVdJeWxYTDZMUElRZ0NC?=
 =?utf-8?B?TzNhSGc3dEVHYUlHajlUU2xBaXdLZk1FKytjMUVESlhrQnAxVWhtZjFuQ0RN?=
 =?utf-8?B?OEc3dysvckZBdzhWU3RIcDhCUTF6ZGtuWHc5enhZSG16aUhzSWIvemYzRnR5?=
 =?utf-8?B?ZHF1VThjRDhrN0xnUnMwMndsY3BQSkNwSWRWbEV4TXA1b3ZQYjdJR3BuT1FY?=
 =?utf-8?B?dnkxZzRwdHZoYU9mdmN4SmpzZmowWldidGdMZEFtTmJvbnhURkxzT0wwMmpG?=
 =?utf-8?B?REt2enBxSjZsbUVWaG5JOEg0NjFCK01pb0oxak9paE1TbXRGdFBBZGpKcHhn?=
 =?utf-8?B?VmwwZXRMUHZzb29aaEVKcTdSbkJDbkt2dkFjYk5TTFBaMm9kR2JRRmdvWmM5?=
 =?utf-8?B?dmJzQ0lFQmhZYkxva082R2xxbFQvWGVhdGRBU0NTdTlkK3JBQnJEcVcyNVF3?=
 =?utf-8?B?Z29hbjU5Q0tITjNqd1ViVlpzVzhZdmQxTzNTMUw3Y09Fem16bmYwdUJqTTN4?=
 =?utf-8?B?OVpBOUVBR1NHb0kxTGVjcUkwSERLZFVOeUNVejR4SDUwTU5RNGxiLzQzd3Ew?=
 =?utf-8?B?bXJzSFpoMjRUSGt5Rm1kR0l3djVoZG83Q2FsK3BQYkFOQ2Y2RmlMazJYMmNZ?=
 =?utf-8?B?WTdEWmliRzVSeEJHbmlRcnMyQkdzaHlNKzYzYjJmS0NsVGtvdVNJZ1d5anFF?=
 =?utf-8?B?S2h1aW00dDBoTmViQU1Wc0h3MGNSbmNNb3FiTndEazRkWHdmZ2I4eFl2MUkr?=
 =?utf-8?B?U1dibXZ2dWVMZEFvWVo5dWFMZzVEb2xaSTk2L3VXWmJKbHNmZXk0Rk9mWDNK?=
 =?utf-8?B?TUFXUEpFU3dXMmtyN1RCcml0MXlaWHk2dG95VmpSWHA5TUNpOUl5dVB2Mjg4?=
 =?utf-8?B?cnErMTdUaFNOV21pNlRsUlBOenhyT1RzaTRiaExycHc3d3VwR1J0bXBScWRF?=
 =?utf-8?B?T29DVy93ZUNuMW9vcGMyMEpsSm9JTCthdDY5NmNuU3FWYzVwNGdYbTZFZW1H?=
 =?utf-8?B?YWNNMXdxb1FRSU44SUNmUHU2dTZvblAxak9Pc0wyQ1pRYzJtVGtNdnpxRHR1?=
 =?utf-8?B?MGZWZXJTWFczNHRmcTJscXZHTk9CNW02U1psdUJSWnpudE1MTlc3M05wRXBT?=
 =?utf-8?B?RGlBVU5LTndrOGxzZkIwazdFVi9DQ1dWRHcyQjdUV09NWjdhZjFnUTlGTDhp?=
 =?utf-8?B?aUhKREdvRXZXOGJLa3pQbzQwaGdNRXExeWF0Qmsyb01QMzVkLzhwSzdrQjBU?=
 =?utf-8?Q?Dewg7RiW4E1Ri?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnBGTmF3UnVXUlNialYrQ3Zld1l5ci96M003LzltZGlvYnFrYStoZzJ5d01n?=
 =?utf-8?B?OGhnYVd5L25pMWllV3d6eXZHU2g0azFMRDYvNkVkaE9pWitUSXRYTVRhc1pF?=
 =?utf-8?B?TjZsSXhlb2s3ZDZRSnVKRVp5RkVaYU4zdFdYV2xSY2t3NnlYSC9PWG5KY1Nr?=
 =?utf-8?B?dXRkVUV2VUFwZlJXZ251aURWRlpQSjZoT1JDYWNOSnZJVlNGNk4zMmZsRDZK?=
 =?utf-8?B?L2haVldEeWM4Ly84U3d0QzJmL2ZueU1IZk84RzFyRmYvN2o1NXBiZCt0VmdF?=
 =?utf-8?B?WWVHYUxLYjg0ZC91WWt0WDdiaDJlTzRadjdObFpYN1ZmcVFkOXdlbEJaNTUx?=
 =?utf-8?B?V1dSMjRpNzRTdDNXYU9URHhhQVlQTTZsdmVYczZYZUI2ZjhYZklGTG94djhx?=
 =?utf-8?B?QVpsUFU1ZkU2ZDBaUWQ2YWtlVjh3N2MyZG0zelFoV0k2emtKcXpLWlNjWUNF?=
 =?utf-8?B?WTNZRVhMTmhMUU93L3B0YXpTS1ZRdmJCZVh1M1ZOZ1Mra1FrdkFLMTFFUnpv?=
 =?utf-8?B?TmFBWC9TN24rNDJyd1QwNmdDc0Q2bFczQVJBYXJvc0lnNVFubGxISHlvRiti?=
 =?utf-8?B?Q3g2YjB2NCtZa0JlRG9NMzYyNlBQTGx3YUQxR2txQU90NVpZdUtFNWlZUW5U?=
 =?utf-8?B?YmJWRjU0T3k2OVVDSzk4MTBQWlpyMlcvZ2s5Z1ZVclFqMnhZMFM3ZVcwRVZT?=
 =?utf-8?B?NUZ5dlRFakhuT3Jqc05GdWVOWXkwbmdxeGU0Qk9aRmNCM1ZPd3VoejM5Zkgv?=
 =?utf-8?B?TlJoZjh2STFIVXVqQmRUd1k5Zit6RTF4eXVIUXdKLzRzZGRDR3VINEJzdmhm?=
 =?utf-8?B?T1o3bDFIaytTbVpyRXhCYlBLMVY5Tzg3dDdJcURYYWRqU3hCalA4dklnSU9r?=
 =?utf-8?B?MTRVdVFaZEwrM3I3eGJEVlFXOWhVSFFmQ2x5emhrc3RzUjlUTXo1dnZxbHp1?=
 =?utf-8?B?OFVYNXdMeU5TMzIvZUk5aUZnTWhxUU9waHlqVXlaaW5Ocnp6Rjl1STkvSDJy?=
 =?utf-8?B?NXE5dzQ2aEdyM2J3akFQNDQybG1hUUZiM0llemM3bFhyL25mK1Y0S0t6VFg3?=
 =?utf-8?B?eHZROHpGY2xwWHVVd20xV3M0VTBGdnBPKytWbUpPSytTKzlyNXhDWjZRd3Ew?=
 =?utf-8?B?eEYvZitoUFB0VEhpMmRUMEZWYTErUTlxWEpvZnlVUjVJSThHOGViaHBGaUlO?=
 =?utf-8?B?RjNvMlJhdkNqaDN5c2ZEdnRDb1pnMHp2ZlZTYmR1b1NNSkQvbDZ1TFBjd2w0?=
 =?utf-8?B?UU5zU1A2SnZvVkUrVGVUSnE3ZmVSS0RqWE1iZDRBcGYyV2xEU1dHMWRsWEdu?=
 =?utf-8?B?UXNMQWpSQzNDWjVFYnI5L2tlRzBreTZndlRpR0IyY1YyejBvL0t6T3MwalJV?=
 =?utf-8?B?WlNrbmpBWXRPYnhlZWQzV1JJd1ZjR2dZc2o0Z05sWFZvMmsxcWR6dER0Zkla?=
 =?utf-8?B?eU5DWTJCelJqVkZuVEhnODVmVnI3RFhSRDBmellyc2JVQ1N1NkpJSWZnQ3Ra?=
 =?utf-8?B?R3dHNVgzWm5KaW8xV1k3RW82UGtaSTI3ZWdOaTlUQTcwejRhWmphM2dYamh4?=
 =?utf-8?B?cjV2NXBEQmZ3bUdSbmpFeWswNmZUTFQydmRtTDg2RFlWb1VlMzRiN2lVbHI3?=
 =?utf-8?B?YXJ1VDB4L2ppcmN5SUhPdWltZ0hmNnorNmpyOEtiZCtmdTVhdlZITFh5T0VF?=
 =?utf-8?B?b2MyMzBwbld6TG9mUTNNZi9SZC9iQWozZ1ZSTmZ3aWZTM3AyalFSZDhLN09u?=
 =?utf-8?Q?C2QZ+p7L+I/BWyGwZB6K3AkbAUCKzQL9cMqRDws?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6ec4ec-a8b6-48cd-a0ed-08dd7c7b55db
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 00:12:14.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0142

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/f8d04cb180f344c6a4e6d30259f7a11e814855a4...09dbe035d6e39778f7f0dd5df6d0d2ba8cd94f1c


Othre minor bugfixes merged into master:

- 
https://lore.kernel.org/lkml/20250405055625.1530180-1-inochiama@gmail.com/, 
which is required when enable MSI/PCIe contorllers for SG2042.


Thanks,

Chen


