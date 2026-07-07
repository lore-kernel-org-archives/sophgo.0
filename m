Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011029.outbound.protection.outlook.com [52.103.68.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC66227BB9
	for <sophgo@lists.linux.dev>; Tue,  7 Jul 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468416; cv=fail; b=Bnt2+d3HUCcvf6mdKdgdwlPkMkWvic8v2IJ0NnCdtC8GSQE4GBEy1/aFVkUu/08pzhli7EV7TlfOUcTocpGul7ylK30YH8FTGlJFEe2cPv4Z0iqDPzLaAjgAMGNqPr83OniCdFq4HHR67BcWsZ8nGOQAKl9Bjwv/IMBaqYnwT2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468416; c=relaxed/simple;
	bh=t6kcsB23pT0r0LaEmx4hzcdnzIGG3POKq25ZbtBNnyI=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m6PBqsVmTUZuaAtpXcpGzbQeqrit/d2cBaBcDQS4kAIC8E+cEkNcrpa8e0VJd0j4PYkoZ1FpyRbTxXlZyTJWFwvUijFFwApY/fBzzHXZUmKl2rCCkN1ULpFbq4JksRfq1wsgZgrV3qCTFg2/+yxktVr/ClQonClh4iZ6+s12RhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Pa43/TzR; arc=fail smtp.client-ip=52.103.68.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Pa43/TzR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5xr0I8ZqSnWjczpEE71PyWmvWw+VOQaMvrZb1bx+yjsM/etsLEDeUSxlVx1BrPkywYAbbzdv/d5aPabTbg8fzgPfhs/lF5Q2yjnyoEe+5z1zhkPpYxnIGUPew4iCZBTe9vj5yYFRXl8AyK9smTNQ+9UR8Pz+KUu+lX1SOY6s+OMv85aLcfGUCqVNXAsnHKaMvezN2bX8nKPPwmzkogrI3lMBzNcQqRk6AcOf1FjH6VhDmBzMRkciIRMtcJmUjLhv7havs6hsTZBwg5C0CVK/Z07ebVAfeS+r6EP4N1oz7E+AInSyaDCYcv/+hHSLasq+z8QrHGcRo8xute9pMKOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6kcsB23pT0r0LaEmx4hzcdnzIGG3POKq25ZbtBNnyI=;
 b=UTVjMhMeodYt96opZzCjgMFVLnls8Di0XdIHoBuy5Sv9a4Ric4m1aDRGkdYmPtvpBEVdZHDYddFeNrYF4YKQ6YssbpyVDsNrM79de2GSAp03Lfu/zuj+ZuYlhTvRew0THtZMU+T+cy3z6eNXxhLwlcarMBy7GZ6ag5kWeoS8xqjwjlhU0xTKa2jF3qeZdVWCWyU2U692MeSCDYl7RUOT7l4CO9VMIsS8PIhkSt/FUO+u/C+mTjHQfvBiMeN3a/EEa+lBFISi2WUYsXnkhVrSY9HK9GzcDWtURX4SoGZWLPBqS4Ezq0q5llHAaQ3KWkMAWS6ifMThmaDeBPaGBn++YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6kcsB23pT0r0LaEmx4hzcdnzIGG3POKq25ZbtBNnyI=;
 b=Pa43/TzRuNzk6h+IcqYlUHA1crhuJcvHBoqFEx/QW7OHELCfqOSYwsbuYcgot+hnQrDUzpDW8QN0DiTul1lg8qIX0FScerD1/9A0DA5f/PAO6hSYJ7whYFtu4M+FaDEUGS/qd9hsPzQpF7E6g2NT5c5/IBY3mWNA+yaMwTxRyL/3TjK5BVO9vypUhJBdFu9z+YAu4HdrdmIPDHM7WfsoCuKY4rpPokDwdF4Py/Lk4kcNmgq3a5C1UCq7YxrQDOJ+JnQXz+vw2aqhh93VOhEUPkGS7mTVBCo2fgOeyJ+o4s3fn09GvlB5S7Ohg2IYNj3aaxqYvS/+KTAbTnh4KsE7cw==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by PNYP287MB5639.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:325::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 23:53:29 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%6]) with mapi id 15.21.0181.010; Tue, 7 Jul 2026
 23:53:29 +0000
Message-ID:
 <MA5P287MB6080E388CC6CFC501E2461DCFEF02@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 8 Jul 2026 07:53:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: zsbl PR #135: sg2042 bootargs clobber fix
To: Paul Sherman <shermanpauldylan@gmail.com>, Chao Wei <chao.wei@sophgo.com>
References: <CALGMsBBMpK83=MchYiXj5WMnDQQwNrO9F6_EKQ2hiiynt38=Ag@mail.gmail.com>
Cc: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CALGMsBBMpK83=MchYiXj5WMnDQQwNrO9F6_EKQ2hiiynt38=Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <aaf65fa9-1950-4113-81d6-a9f359f6ed3c@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|PNYP287MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: bdda56f7-964d-4d3f-1785-08dedc82f129
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|24021099003|12121999013|8022599003|8060799015|19110799012|25010399006|5072599009|15080799012|23021999003|25031999004|24121999003|22091999003|10035399007|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c214Zkh6TDRJQXA3NlB1cm5xNlVJcVE5OHUvYVRFOE1BSTUydjl3Z0tRRFJJ?=
 =?utf-8?B?eU8ySzFrcjI2blFmNUlBTnREdk4zak1pWTM4MDFSbTJvY1JEdmg4dFdnSnlF?=
 =?utf-8?B?Tmlnam82WXdNQW9BL01oV1krYUoxMFBnSkkyQk1hZG1kVTNtUkVmTFNIZHRy?=
 =?utf-8?B?dDZad3hNSmV5Mm5vb2NkTmU0ck00QjRic1pBckdYN0krOWhiNG5qamhkWDIz?=
 =?utf-8?B?M1IvMXhEdk1zb3crdFMrMlliREJRUzFIMThZbERlU2d2RXZ1SFNLQU14OFA3?=
 =?utf-8?B?R3Y0M213OVVDRThIbThpa2lwbU5JTWJMaURCZmkxQkJ5c1ZBVmcyWlI4ZWFw?=
 =?utf-8?B?RFNrMGdMVHE2eVZGbURwR292ZG8wRHRmYmlhc2w4bTQ1MkxHeDhjd1B2MUgr?=
 =?utf-8?B?emc2cXd2WFJ5YTBUQ2ovQndJR2xwWi9rUXJQWVowaURMLzZ5RXViZGF0T2hE?=
 =?utf-8?B?eFZmRjB2ZEZQVjVBS0FNdUlsQUdtZ0JFdVc1Wkk5TFYzWXdRV0pIaXg1NFdN?=
 =?utf-8?B?QkNIYVpoQjNGQXljcUdoVER5Q1dQS3pPTHZmRUxRcWVMR3RhVCtCOGlMNkFF?=
 =?utf-8?B?bDJhUkJ0azFhTy9hdmxVOHJPWjZMNDlad2Z3RkU5ODdtaHdvUzM1UkcrVEJK?=
 =?utf-8?B?WkFZVTZVdGtXUWZ5eTg2bWNRZjNRWXZhRzRJWCtabVVXa2VWV1lCcVFnZml2?=
 =?utf-8?B?Ykh5bENTTGxGckxFaUhCcnNIYlNKckNpZjJINVFndU01NE9OeHR6cld2SVMz?=
 =?utf-8?B?Z0JuVW80ZXhERmg4Y3M4UFg5K3l1VUdWM2ZGSmwvV1VWTmQveXdQQnR0YzIz?=
 =?utf-8?B?aVcyVVVBd1FPdlZlTkVwQTdDdkdDR051dnA0WHplb0RveTBEbkNzODJoNlc1?=
 =?utf-8?B?MGFNMW1IVW9FTVd4NFZnaW9pRDlkd1pUTWw2SGJ3QmRkV2w5QVAvTmpIWFIv?=
 =?utf-8?B?OThMM1JYQlpTQzJ2L3czZlBuVjZMSm14ZUwxTnUrYW9mZXVBR1Vjbk5qUGNp?=
 =?utf-8?B?RytBTGU2S2k0ZDBtWXBmT2dKdTlKRnpRYjJ1ZTk1bWR3bGhzbFRjYjZubkc5?=
 =?utf-8?B?ZHBqdTVZT1lQaGN2R29haG01UWI2cWFOSVhlK1dHMHdZdmFtVURCM0s4cFE2?=
 =?utf-8?B?aFFQQ0lNRXRCT05IV0VoQllzWmgwU1lWZ0tJZVJhVlhoTWlwSCtOeW5lZ1Yy?=
 =?utf-8?B?UVVFRzBCUUNhZTlRYmZBSTlRa2ZQQjVGbFJwMGN6Sk4yczFCMzl3TXhzK3c4?=
 =?utf-8?B?TVdKSDBDeGFsRXV2OTREQmpNeTRha2JHbXoyWnBobmFIN0lvMTZBdVJaWmYy?=
 =?utf-8?B?cUNvZzNvS1p2REJPc1B2TGxma09hc0E1cUc4UGt6RWRiZkFSZnJrSElzZUpQ?=
 =?utf-8?B?U205WHFmdGR4TkNUZmR0V0MrN1ZtT0JpYUNGcUp1VlFyY0FZeTh3Ry9WaFVR?=
 =?utf-8?B?cW9XYkVZbU5peTVNK2tNeFNvTjdMK0NROVFxckV4aVZSc25WUG01S3BicEI3?=
 =?utf-8?Q?ztD94c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mzd2dW5UNGxUZ1dWY0U2UlZBQ0lSWXE3SlBlWE84QVNCOUpvV29BMkRaakZ1?=
 =?utf-8?B?N0hIUHFFemk5OWhVWjF6cjhuT0tJWEwwOTVzdVVjbE84cWM3ZUpiVVZPQnZi?=
 =?utf-8?B?SkpaQVRKQ0JWN1M5RVY0ZXhzUjNreFdLd2hjdkk2bWZUd1lkSnNybUtMTkU4?=
 =?utf-8?B?NDc2RUxJRVQzamQ5SFl0UHU2NGU0WGVCam1CREZkcG1vbVJLSEFBR25mTUg3?=
 =?utf-8?B?cy9aTjJhK05MU2ZncEs0ZnRHWnhycEIwNEFXRFBQcGppQ0NYam4vZGpTSy9B?=
 =?utf-8?B?VWdlbERMcW8xQUkyNy9VbXlRb2YrOWRwTjlmRWpqcUNBOU9GaHoxdXpaYWds?=
 =?utf-8?B?b0pVbVFqRVBKWkRGWkxwMGFLdnRXVXhVU3RJZ0pTNG8wYko3b04rYTJvMjRk?=
 =?utf-8?B?WTB3VmFCSjRUWTFack9oLzJFUnBzbHo3cGUvWHFNV3gwSlZSVHBIMDl2ZmVa?=
 =?utf-8?B?Sldocmw4dmxzYnJraUloTFBuWjJ2RkJ0RGRXdEFCWkw1SThKQWIxWkh0bW1s?=
 =?utf-8?B?MjBzazg3akVMS0JKZXNoMlJZRXVOTVBNQVhEV2RvSEw0R09zSjBBazVmOE1P?=
 =?utf-8?B?S1JYODdydzA5V2FSUFpuaGZtU3djQjVHTCtMZFdHUmxKQzRJUExSS2gvUlpj?=
 =?utf-8?B?RnA0emkramltUmN4cVYzL0dIQ1Q0ZnJGSndmdi9jemdOZ1c0alAwdWZGWWhR?=
 =?utf-8?B?cldIWGFYc2o3bEsyMmdXREV1Q2IwOXFBOEZVSmg5dzc2MldLZVBTN3RxNHRi?=
 =?utf-8?B?NForWmpkRWR3TUx1dHRyMEZtb1V4bVd5c2UycXk1ZDMvNEgwZ05sa0FaYW5h?=
 =?utf-8?B?MU1UMHN4Slh0L2NxNjRINGs2SXZZUGNwbjd2bUVJYm1ON2d5WGNLOElHVzBx?=
 =?utf-8?B?VWtXcXZnY2d3WXVhNjNYa2c5UkVQUzBKN3lkRm8zR01HSTFDVFdRdUlYUitF?=
 =?utf-8?B?cVhINVFwenQ1eEJ6U2pUSXNtaU91OVBOcC9lRmhPQjd1ZTZTa3Q1eHJXcnpw?=
 =?utf-8?B?ODdUdFF0UDdKY0VSd21kM01pWEt2b3lRemtYSjJhVGdvVjIrWHN0THZoemow?=
 =?utf-8?B?d2NBTlUxRXJvUU1JQU5BNmZwckxTWXZGYlJvUVR6REhUb3JGdHZMS1Z0R3B2?=
 =?utf-8?B?UlVYOFRkaWEwN1ZEajAxZE5xWXJtTTAwRmQwcEtSNlExd01La1V3MEFqeGgv?=
 =?utf-8?B?Vk9jTWRGNytBNGNaRXN4ZmdBVTdMVDJzNlBvUmlhRmRsVksxQmFoU2FBMHRW?=
 =?utf-8?B?TGRhQWhvTTFGb1E5ZHoraU9QTzd0MXAzSm54VitRZS9CUUlkd1kwalNOSkhY?=
 =?utf-8?B?b0o1UDhWUytwaXYyQzdIdnRZMVA4OVJKc2VKcTJiUnJkZ1FqNU1uenJpcFRQ?=
 =?utf-8?B?clJGNGpIcEZBd0lYc2luYXNGcSt4WlM3cWRVbHB2NmEzQWh5bU96aW0wVTNB?=
 =?utf-8?B?OEswR0I4RDR5ZjY3cHpzWTEzMzBsVEpnVU9JSjZqNDA2MlRUcnBvR0dDVjNO?=
 =?utf-8?B?M3hqZmpWUE5aTG1qN0ducFJ1VHVhTnZoemVvM2VHWFIyYmxBcFpZT2JCa0Fx?=
 =?utf-8?B?blBZSGViL1UxRzFZM2lhVVNoQWlSOUsrMldSR1JRajZhaXVhK0pJTTN6QW9q?=
 =?utf-8?B?WjZOUzh1bWUxbnErV3FjL0JEY0VyWExaTjlpSklmVjBxNFNaN0ZJM1ZVcndL?=
 =?utf-8?B?NFhyd2ZsUHA0V1lLVWkwMUV6V29UaTg1ZkwzMU9BR2hDV3hEcld1LzNEWDln?=
 =?utf-8?B?N2RZWHE3cXk2aFBMckJtYzJUaVZhRXh3dk9FV0V4YWZpdWxzRnBwTDM0cFBW?=
 =?utf-8?B?MGF6a1RHUkFrOVUyS1Y5M3FSZmpObUZFZ2VabFc4NDJ3RExEdDRmaGpUM0JE?=
 =?utf-8?B?ZjJTSUhvdkF0c2xHZFY3eFRSOWZ3MHBhL0hRcisrNDFVRnU1SnE4V3ZyYTFO?=
 =?utf-8?Q?qDyn8Tm+RYkLD76tchdLtkJwwoBQlh+P?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdda56f7-964d-4d3f-1785-08dedc82f129
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 23:53:29.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5639

Thank you, Paul.

Adding Chao from sophgo who may help checking this.

Looping sophgo dev maillist, just FYI.

Hi, Chao,

Could you please have a look?

Thanks,

Chen

On 7/8/2026 5:47 AM, Paul Sherman wrote:
> Hi Chen,
>
> While working on PCIe bringup on my Milk-V Pioneer, I tracked down a
> bug in zsbl where modify_bootargs() unconditionally appends
> 'root=/dev/ram0' to the DTB chosen/bootargs node even when no ramfs is
> configured. This silently overrides any root device in the DTB, in my
> case the NVMe root, with no diagnostic output.
>
> The sg2260 platform already has the correct guard (cfg->ramfs.name ==
> NULL check). I've applied the same fix to sg2042/plat.c and opened a
> PR against sophgo/zsbl:
>
> https://github.com/sophgo/zsbl/pull/135
>
> Hardware-verified on the Pioneer (64-core, 128GB DDR4). Would
> appreciate your review or a pointer to the right Sophgo maintainer if
> that's not you.
>
> Best,
> Paul
