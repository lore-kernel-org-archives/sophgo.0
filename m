Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12E17991
	for <sophgo@lists.linux.dev>; Thu, 20 Mar 2025 00:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742429915; cv=fail; b=u0/6c+3CsLPR0ny9IbmXg3IvrJYAnYzf+8I921Xe7Ln6zjdNldMUnK6VHFU/E9/00iuAPPQH0Ir+maPa7G5KLNSXAvqKeL4AL56fj3jMImXorJJbFRQVuXr0oYTACUZnsZr056dx8U46fi1XYTbGb1/+3SvxW3gh3mS+lH2hiYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742429915; c=relaxed/simple;
	bh=4mw+O58EByRyXxr2Cu6dR24IpJOMpAUHZVbCIiA6riM=;
	h=Message-ID:Date:Subject:References:To:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nZz0UQ0sb//O548uLsT1n2mrstRDt6uDHOhonR/eaTQGr0ZT/66G+OXJw/OETROoCmf5PzsSOMNQrZJ27K/tTIUslinL/SF2+ozPCj1UFVmN0bx9L2gODl9Vlv/QYnVLocj+vkSqCkumaAUUbraV43oYKIZXyC1e92ICwMELcec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OoFPrHHa; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OoFPrHHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSVXdk3aJDfwJ2oiBmKZrIQsH+IdhSL82I4/HKqPoz/p1oFKbuf60VBMLy6ImVak7SoFtSclxtTuhYP1NWjEkErsSAM8/Q96/ZAUVk/JVrH+2PzHd8kFMVMZK+lWYX0HOMH6b67RN+oHDAgYCX8C4Bc4S6MfPLvDenar76rESeIVxSSUJtjaW510gfqyizXARnReUJAgxrl4BlVC45JwoafVCB65i6tS5l0rX3ugnMn6yQ4F6NbydYPetMngYpBGppZeCU1cVDVpiZdJjDE5I/AJXA72XvYXztE0ZzBtOZq0RRG3+dh2kKjiV3+BK3uTbOnIdQarl2OzN9MOBbgN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag0jJ3CGsLLTuP3A70V+yNqupKnsd6NlBuqE5rUcAcs=;
 b=RsQ/waS8+pUMIaMC368+9aNj/QTnuzYTEaCUexv9M1wni72rAQrLiBpRggfOPv9Z4U/uQTQYGr2IZLDBOlYGqEGM9RP3BbnquggnpZM5m6n9lPW+Ogca6UVfVA/OnOYzGZDMH6tlz4cf25+5xJBYS2bvPAC5AkIGa4PYNRBYQ1tuT3wmZchAZRn1BkLmgjGlR8R0jHSvNfc3eRLsheMmWtBteJUi/FYrEgrPVoKsrnZzRE8jbC44NgcwylIY7JER/KIoyC2jYkbq/J+9tYA3wVeAKgFfNr/A0ieZs9eKsjwHC7UaiBI5MMgGyLmsTHpp5JpG2OVc5sVdD2olFojCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag0jJ3CGsLLTuP3A70V+yNqupKnsd6NlBuqE5rUcAcs=;
 b=OoFPrHHa6BaPPznG9jAjvrKxfc7F+38iUpiF1Q3DfyzZmwn0Ew7pjaK08En4KlrPYsl/QYdIcB+6QKgmoqzyL62NuOQWzhmBBkl4OP4xqtf+am6535s9EQ4yBhLbi2xvgmL/yHgIfO8vwq43FQNK0iKfUoMCeBpQWa5jsB9O6wFPz5d/FPNE3/EIaRXnTKoDgK8JO0Ojnaoe3QiF9x1Os+a8qpK64p3nBQfHMhWTWGPlhoZjtck/RJdz47QVWEYQfF1N8OFkbDuHThEy8jPKlvtJ4qAUDw0yCvZkU5XL5qThBIGnstA36KbE3v/NzNOOEeANh1hlj2NRsup6X228Tw==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by MAZPR01MB7809.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 00:18:29 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 00:18:29 +0000
Message-ID:
 <PN0PR01MB1039314C3ED91718F88FD7A5FFED82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 20 Mar 2025 08:18:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
References: <174242233149.1211847.400595463610872578.git-patchwork-notify@kernel.org>
To: sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <174242233149.1211847.400595463610872578.git-patchwork-notify@kernel.org>
X-Forwarded-Message-Id: <174242233149.1211847.400595463610872578.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::33) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <c2ab0cd5-3be2-4b20-a149-a48b20edf518@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|MAZPR01MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: d10b10e3-ea89-4f08-ce79-08dd6744bc31
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|461199028|19110799003|6090799003|15080799006|7092599003|8060799006|5072599009|10035399004|440099028|4302099013|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHZRbXZzSHBuam5CaVowZDhmNDNkbytBS2RSQVlQdmloWXZORHYxMDl0VXBx?=
 =?utf-8?B?R3l5clRkcE02TUk2RzZNSHJ2RzhVMTdKQWpjRFVyWSs0K1VaUDZzZlgvU203?=
 =?utf-8?B?VWlCWVdTOXdPS2pRaHBxWUc2WDBXRkdZMmNEMW0ybHVnWElhSDVlc1g4bG9E?=
 =?utf-8?B?MFQzQXhiNktBUDcxRUNBdlFoV2k0OEpSQ2FlQ3FDc014aGlmYXZ2U3k3Mk5j?=
 =?utf-8?B?UHcyNXV0bFVxQmdFeXlRdmVlVDJnR0ZRSW5IU2c2YnRhZU1WcnluMzZTTUZk?=
 =?utf-8?B?OWxzeW5TWi9mT1pOa212aFlxWjR3ODY2bmJOTC9SYmI3ZnhLMmtvaWFRYkNa?=
 =?utf-8?B?UkNoUkQ3dCszbVlDMW9FVURBNGc5OEVXdTlZZ0hhcGxIdnF1WnhmdFZMam5P?=
 =?utf-8?B?TE5NUjkwV0l0TU9NbE9VUHJEYjNwd1B0c3BaM0JER2lJNkFGTWZQS1hha0I4?=
 =?utf-8?B?ZkJLN0VVejh6K3RrQXR6RkJ6Q1lnRVRPSi9lbENLenhzUGIxRFAxRmhvczdI?=
 =?utf-8?B?THA1d096UEplZnZYVkhPRG5scEZqVnlINkxlOTJxek1mS0FKb3FjSEJndEhz?=
 =?utf-8?B?RW9xMEQxT0YyY1llRlZuak9ESVZZWTlUSEVXQ1ErUEpuVHlwK2ZFb3RMdDJM?=
 =?utf-8?B?T3gzcC9IWlFrTnNTZDU3NW9YNzc3NWJMYkhUdGRtWUlKT2h4YmpmOW5peUFG?=
 =?utf-8?B?MVU4VDgwbWVRVXhxUHVOVFIyMi9zMGl3dFNaa09SNlN0RkRQakl4MmZMUUJ3?=
 =?utf-8?B?T3A0TmxTU3RKY3B6cnlXaGt6cUFYTDNDVXlLM1BZZ3BHZEdWZ1lzL0tqWFBB?=
 =?utf-8?B?ZW5pa1grUVJucjVjZjRWWnF4dzRRcCs3dEJLZVdWdEltVmtBVkRzaVY2NlZI?=
 =?utf-8?B?R01KaW9kZHNjNW5jRVAwdVloNVJrbWxuZzQ3WkdMR2ZxSmdSTDlZQjdEQ3RL?=
 =?utf-8?B?U0trWSsrRnVzUkVDdjdaT2lsWHVlVFh4Y0crdy85b3p5UVNxSGdEZEoxSjh4?=
 =?utf-8?B?bG9GZ3pBVWtCVUlRd21ueFdOSEtVbWhEMVpQNTFoNzhmUi9aN2R5WHhIRnE5?=
 =?utf-8?B?b3I5TytwUit4M3RvU3RnOGFLTVZaL1FBQ3pPUXpON2Z0aGwxQm10TG5OdjFO?=
 =?utf-8?B?MHUvdGR6WGdyVnh4MmNYNTVKNXRLdFplRjRGYmJDbEU2L09WeXI1c2Z0aXY1?=
 =?utf-8?B?a21PUVlaUXVaM0dvQnU2cnlVRit0MWJ6dy9DcWhXd1hUakpUSGxycHJwUWZv?=
 =?utf-8?B?SHhVamlQT1RQeDhoMzRBUW9RRFVOTGdEaHZTT1BiUEFyWjNjWlU5Z2R0bkpk?=
 =?utf-8?B?allvdGRRZnd6YzRUV3ZSYzM4cVhrMUJDcmFRbTZkd0hTZ3ZmSGd3cExqWmRZ?=
 =?utf-8?B?ODVoTElmd0pPSmlxRmduRXp1K3BMVG5ES0dqNGZoVmp1OGxsNXFFRUN2TTNx?=
 =?utf-8?B?dnhiL2Eyd0ZiVE5LdXMzb1Q3OUVtR0t0eUFPSWVtVmUxUFh3QzhHd0RiSGkw?=
 =?utf-8?B?Z1orY0xralhCMVZ0NXgvaFAzd3J6eTc2UlBBNHVaVDg0dUNzN29hYTNVMFBy?=
 =?utf-8?B?KzZWQVRmUjJQRytEUjU0MEUvQ0NqOHc2U0dPUzZPeXpBWHgyMWZDWC9GeitZ?=
 =?utf-8?B?ZWhndC9QSHlLT1pqVStIbVRVc0YxOUxoVlQwNGRPUXlBKzVFQTgybFF6d1hQ?=
 =?utf-8?B?UWc2Q3NhYVh3NU1hZ29FL0ViSnNqS1JMc2VTKzBwT1kzRXo1RDdBUHczTkxQ?=
 =?utf-8?B?d1FpbEJnMmZGeHlKb1lRYkphOXFuQU4ySXpkZWtyaVNwSmtnS2crUEJGbTRS?=
 =?utf-8?B?SkdtV0RzUkpkMmdiNVNaZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THpLUDV1UXZxY09KMHpGRlg5Z040NEdia2F0aUdWMmhoemZURjUwQzY2clNI?=
 =?utf-8?B?di9Zc3U4NnRlb1FCbmFBS3NWOUg1Y3FNeW0vaEIvQlNCdjVGWXVlSWY3VXJD?=
 =?utf-8?B?c0Rrckl1VFpvUEFCTmRRVWMvRzMzWVd2UFJscitpMHZ6VVZxR0x5YUp3cW4w?=
 =?utf-8?B?RTBaTEM2WmlId1dLb2N2NGd3L0tnekd2cCtEYmdMUmxhTjZ3WW9FR05VMXNQ?=
 =?utf-8?B?MFdMUXBtOEErRmNGSEdyRUxSZEE5aXAwb3JzY3M5N0pUNnAybEtkSVdReWM4?=
 =?utf-8?B?aEJaR3dqRU90clRzOXBSTG83blZjS0g0OFBOaFpSU1ZEM0JxR0kzaHQ3WVNj?=
 =?utf-8?B?akVJb3JXWnNDWnF1dHB6UXhhY3NsQkJFeE9Fd3RJeVF5UFdpelk3djBwTEQ1?=
 =?utf-8?B?UDdXZmU2Yy9ZdTAyTDlSNEU4Mk1la2VHdXI5UjdmSWVjRVZsMnJ3cmdoQzJR?=
 =?utf-8?B?dEx3TmxqMDUvWFpPTm9iNmZoWUdaeDU3dCtaaHJkZ2JBcDREM1N6T3dQUkUw?=
 =?utf-8?B?TE1uclpGTEFIdG5WelBkMk9ZTFBUdnlEdjZKRW1rZ2d1cnQxdS92dkVKWFNH?=
 =?utf-8?B?aThJV2k5VlNIRXM3dTVYMys1aXpWM09aSFd6Z2RFTWlvTWIzMldNSmZ4akRU?=
 =?utf-8?B?ZnFURTJnRlFSZ3FtRWpGaktoaStSczUzN3ZTZTlHV29IYWMxRUErVEJocmkz?=
 =?utf-8?B?YmpIeUhUZzRMa2p1N1lHOE5JSzhKcklhZ05hMHNidTRTZEs3Q3FSWW5XWEVx?=
 =?utf-8?B?ejNiY3k2TE5GVmUydWRiRU1PNTJnZU0wcVlOUFpCUXc4UFpBb0hpSUxUQzl0?=
 =?utf-8?B?RlNCbEJzOWVaT2hWNXhBMGhmQy91OERLZ29GSW0waCtOVEd1Y2kyZWsvcXFa?=
 =?utf-8?B?b2FQN0RPRkErWHpveXhKZ29KeWRoelJhUHdmNlFvcStNSHNSYnF4YnN4WjZV?=
 =?utf-8?B?OFdHcGJxQ2d2QjFEbzBlQmlEdDlmMmR5L1dtZkYvajdnaEZSTy9WRWQ0Zzli?=
 =?utf-8?B?UHU1MTNiMzFrSlBMckJkR2ljWmNBbExQTk9RS0NvQ05MajhlQUpwWGd5KzQy?=
 =?utf-8?B?OUFlK3Bpa3dReHdMcHlFK3RTYU9CaTVSd2lkb1YvMTZqVTZlS2RTVGRMVUw4?=
 =?utf-8?B?VHlwbEZsZzdhN1hCWStQUjdqaDBkK2FuZDVZZ3lpR3dKMERSQy9jLy9QR3hP?=
 =?utf-8?B?UGJiRFJLOGtGR2hKTmg4eG5ZMTlnNGcyOGJjYklMSmtTV1R1VjI2Z2FXUXFy?=
 =?utf-8?B?S2FUWHNhK1gzSGI4TklzcTJydWp6UkxDV1JLdTNJWnZkUFhNbWhQSEx2MHhZ?=
 =?utf-8?B?RUJRYXZaM1UvMWJqaHJyd25qMWRYMlczdWRUMDRSRlFOOEsrQ2dPUER2cWcr?=
 =?utf-8?B?WTloaUxyajZ2Wm55ZXNJOWl4Y2luZHRRM2tsUWgyN3hMd3lPRFpCK3lPa1Bt?=
 =?utf-8?B?M2FGTGRnY1p4aWNFVmZIYUtJRnkxR3dvYW5JNmZwUXJEUkUzRGczbDJCMnlT?=
 =?utf-8?B?cHZuNUtxRHlvWDR6Mi9KZTlneUwwbFllQ3ZBSFk0cU05dEcybnN6TlBUcWRt?=
 =?utf-8?B?TDlwZVBLOGFhSUhDM3F2MGo3NktsbjZERkQ2T0N0UWR6bmpFTUNkRG5EdmlZ?=
 =?utf-8?B?QlducEhNV0k3K1k0Z3pEbnBzWlZEeXZRc2ZXbmh6SGVYNjQ5blJ4dFNIem1r?=
 =?utf-8?B?WXFtOGhFdURucFdsRFZrc2pDZldUNE1xSVp2TG56MzZCK1ZFSWNUam5hY3lC?=
 =?utf-8?Q?HRkHyDNIZTUwud8+Uo5CMN+9kLhyxEiNN/dDVlC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10b10e3-ea89-4f08-ce79-08dd6744bc31
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 00:18:29.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7809


FYI



-------- Forwarded Message --------
Subject: 	Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Date: 	Wed, 19 Mar 2025 22:12:11 +0000
From: 	patchwork-bot+linux-soc@kernel.org
To: 	Chen Wang <unicorn_wang@outlook.com>
CC: 	soc@kernel.org



Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Mar 2025 16:43:28 +0800 you wrote:
> Hey Arnd,
>
> Please pull dt changes for RISC-V/Sophgo.
>
> Thanks,
>
> Chen
>
> [...]

Here is the summary with links:
- [GIT,PULL] RISC-V Sophgo Devicetrees for v6.15
https://git.kernel.org/soc/soc/c/43adf498e91c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


