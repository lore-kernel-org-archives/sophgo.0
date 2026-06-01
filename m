Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010012.outbound.protection.outlook.com [52.103.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC7C1E511
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 00:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780273890; cv=fail; b=P9ajoh6aCFvFhMQz45h/wYkmCS1mhunJi+IZx5D7xzwWPBD98OAVz5mKODBqW54DUs7psJfeCykhHsRhptZlUj9AhJW6Nz8jwQ1FwDKG3bsZDi18u/DCLxvpt5HehTL0qPcoXDEzJyeJ7j1svl0i5nrFpRGEk5bT9kVRHtwT34Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780273890; c=relaxed/simple;
	bh=zMueudhHSum9FKe78LCcRdy+gibo3TId6di6tRGLgUQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xl2kaOjiKZX6tnBPkkULc2lDhhyaqbMReLklvapQz87Gpe3rwjt1oG3mn6HwEVgzzO15EJTJq0aenbHgjUlbspv2kjNxrr+kKxXBhfaSax+prVRc0rigcjGHoZ2YZtS7CMGJwogDxI2lZA4Z7khlw80RIUE44VtIm9db2C42SMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kgcUJSSo; arc=fail smtp.client-ip=52.103.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kgcUJSSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtcKTFbfKlPJ0+mA421Yy2D9pnDSs6uwAbmouBxvLli2yX8uG6YulBF6xFDxoj8tQRKhBbnveWKFGlXMMP3rVD8EjIO7ykQDoPDnDKjoB9zyWBb6Cm5E+hxOrHDKNg8LGpAgUB3h14/GuUrXwr3c6MQBC2mMZMkmrbKZyHx04bT/E/7DN+p4aXDH0pBbyE5An3RluDq5jxfXbITv4Nm7ltPkVxyjGvXOaU3Gx5ubvioThIBYOD+2nYLS9eH8pgrez3rjYSabhOhdrOIWdO79Fk2Fa2igcQFD1WT9JWdZraJ3tw3TDxiKtUCdYNPUWVBiwdnt1InxistRl1Q7eFxfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTPkAigDvXiai+lKQ8SjcQddsQLm5zMDXVrnjb+jdW4=;
 b=WlCJabXtoJ0UKgFzTVuUEF6Y1HYYANSpOmeqZdltzjJ4ARLSJvbGvNjUS686YLicsybgx5+sguY+j8pAyjqwvq3NWev8ljwFrjX4Y+49dEHaKj7rbDNzXXcZNG+Ta27rBZLmSAST9QJaEo8Q3VBFEUrOGZMBAudchEu443yCYjTf/IZfhP5Kz7mGT96TbljgtWpUZfudSEG69geeytqlrtiyi99LNSuIlMpP0w7T0gu8oG4T85I+uv4lGpunCa2YH/OV5Dx9YRAkV9H+ZGfpIezon5+/feaEsXaVidJZ77LybQ/gomVN2lu5AXZ43F2HF3xGXq2NHzmsPv7o2j4ldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTPkAigDvXiai+lKQ8SjcQddsQLm5zMDXVrnjb+jdW4=;
 b=kgcUJSSoEdxLmxvDSZAxGV9+fsHI/2uH2PjKBcQ/0hYA7myMmW5giKzt/x7WbaqBtzfykynHSyrE5JBOnfQj46Ftj1IfFuxtq0adzZWbBgrvJKLIDQfNizy5qnxkjrBzGkJs2ULGZWrpd425U1NbHbIPvbEQWV0DhLmN5zdqBuxA1OjpOUgNu5K2I+OYmUBplfpKzJlJSD33i0orPErfiAFcL66qhFis5CsPe2UIB6fblxy5Ar7NxZkVSSqmjBuxsYHJa4KqEg5tyIZ5NEjAybakgm31/yhXf6ejEc1ZmnlI2hyD9WajfEJWUid8e1UpF45AtZkvTsu7/H+sZqu/ng==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA0PR01MB8225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:90::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 00:31:23 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 00:31:23 +0000
Message-ID:
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Jun 2026 08:31:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: SG2042 SATA (DMA?) issues
To: Michael Orlitzky <michael@orlitzky.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@outlook.com>,
 Han Gao <gaohan@iscas.ac.cn>
References: <ahu57vcS0oOFmCI9@mertle> <ahxOMJqJTqKfY9SI@mertle>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ahxOMJqJTqKfY9SI@mertle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0093.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::8)
 To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <b221755c-1453-4d42-afa0-725d3c21c46e@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA0PR01MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: d22abd45-7a1c-4372-1785-08debf751b97
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|19110799012|15080799012|23021999003|6090799003|24121999003|22091999003|25031999004|16041099003|24021099003|10035399007|440099028|3412199025|4302099013|1602099012|40105399003|53005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWNySmtVU2U4QURqMUtiYW9ySXlFYnM0QzRUMVY2bmpNWHRBMGJNZCtUeDg5?=
 =?utf-8?B?Zkp5NE82MUU4YnlicWVhakpKZ01wcUpOZC9UOWkzTTl4RlZHTWlONmRlU2JO?=
 =?utf-8?B?RW05VktOTi9sVy9qOUlmV3FlNE0rdjJUU0h4WEx4djEzUGZBVHZ5Z1dVK0FQ?=
 =?utf-8?B?REtqL2J5ME5LWHRTRWdKSWdWZFFVcUppSUVCdU5QTjBGQjRYejZWSitKa3FX?=
 =?utf-8?B?eHFNb3hvSlRnTnpuZTBtZ3MvdHphVXRzQkZLd3JPVFdNMHlvYTlYWnlBNzkr?=
 =?utf-8?B?WXMzR2svaWtsMXQzc3Z4cm9TQXc0dWEyMVR4RzlNeHMwVzBOMWVKVVFSU0h2?=
 =?utf-8?B?THFiSmdURGQrWUJiVHRKZ0trSnp1WjNqa2ZHeElvOEZrRWRjUGI5TG1zdUhX?=
 =?utf-8?B?ditzQXludFl4ZnQ3ME9tQUFSTUFpdDlPYkdkYVY5UUt5SXR6SUtDb1A3c09a?=
 =?utf-8?B?bkt3TnRVSStocXhQc2JkZFdSQjVTQ3RkV1VlZ2JyMG56Uy90ZCtnUXIrMXNY?=
 =?utf-8?B?RSszaU9CNzl5OWZLMjEvMGVuU084NFBVZ0F6TWJ3SGI2RFZDR0NJS3hPeis4?=
 =?utf-8?B?U2dJbHFnNEJyNXExZ1RWVG9nL1RKY1BTTnp3enQzOHRyak9pOVZzY0hwbUdy?=
 =?utf-8?B?RnViRGNGc05xZ2FadGxrRGozZHgrNzJyb0VIVDl3SlAxeEkzRjkzNGlzenBI?=
 =?utf-8?B?NVNKVGhyZjMzRnp3T2I0d3dYWTNSU25qRkFYSXhJbEFNdGtiOGhyN1RiWjQ5?=
 =?utf-8?B?ek1oTGxON0FzYlZYS2ZiOHZpMlI5TDYwMGhyeHZLSUtsTVpXTndEaVdpY1Ir?=
 =?utf-8?B?R0FTTFRsSHVtaDF2K0VON3hxREk2WEtYRkUrOGdHN1NlcEVxWkZsaHM3TnFx?=
 =?utf-8?B?NlJQRm1ncjRSTHF5SmJGcmM0endqSVRCcGVzcVdOa0JPZ1FiZ3E4cUpvNHBM?=
 =?utf-8?B?ME5qUUdKck0vWm1XR1BvNEhDRHFCNUdTVlhDSTRlZ0lETVhFRWJLeDhUK2xK?=
 =?utf-8?B?VTJudHBpTDJqUGZtdnFodUpRTUY5aXdudlJoVUtBWlZzRlFNSmtIS3JJdzNO?=
 =?utf-8?B?ZU1ndzJZanhPZ3FLK3lETjI0M1h4NGNOV2RiUVQ1QjlpM3RtVEV5cnZpcmpV?=
 =?utf-8?B?amQyRE4rWGpJaUtuUk94L040SmYvQWJjKzJYdHlNdEpxajd3S09VcEhGK1ZT?=
 =?utf-8?B?UHgvRXNCTVRkNVpsc213OU9aTU5yYzBiNGxsZWNxMVN5akhhNFQyK2JvUEhX?=
 =?utf-8?B?VjJxYkZ0eVR6NThmVDBZRWNEWkR6cUJmelFMck1JRlBDOGpUOEJSb0taV3pn?=
 =?utf-8?B?WWlWdHJOMUtUT1M1dlJUcTRISFFhMWZZdG1vR0plZzl1bTh1bHI3eUpYKzlo?=
 =?utf-8?B?LzZBZHRPKzdKRkViZkl3SmplWHNTajh4M0pRdDgvY1pzSmViTitCTUhjaEpm?=
 =?utf-8?B?TjlzUG9EUWdwV2RPOHg1VFdkUjJCemxleHVhN2NlaHp6eTNnZUhUeGdJejdM?=
 =?utf-8?B?UXBZNXdLaWwxUE11WVorTW5hS1JkOE1zMythbndPVXlIWXhES2lYVTQ3YzBH?=
 =?utf-8?Q?qKKaGWinWsMAI7ynq0jzKe2atWB9NP4P3wAFU7Z7dg9vaT?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURqTUczWFhjekx2Z3c3MFVIM3RSZHloZU9LdTJoZ0N0aC93NTBJLzdPc1Bl?=
 =?utf-8?B?RUNmYURsOXVsNVlObnRqam1DRUNxdDhlSEplRml4a0oxSXFDUEM0TzFaaiti?=
 =?utf-8?B?ekMyRWplZGRxVVplN1l1VXpZNjNSSUE5Y0cyRm9PQUpCRzI3NCt5N2JZOFB1?=
 =?utf-8?B?WTJGdFhnd2dGRFkyUndKUWp1bkxPeUFFQUZkUVVvMEJieGpJU1g1QXNmaHFs?=
 =?utf-8?B?VmthbHdHRHV5MWpUbklNOFpDc1dzQnM2WDRSQlU4OEEzZTNMMEFIbGthOUI3?=
 =?utf-8?B?dDZIcG9hSWZYVXl5TkQxU3M4bXFPVG9LZHlsR0owZ3M2bXBqblFCazZva2xz?=
 =?utf-8?B?dThXNllJWWplMDNER05jT2VKT1BTNURieCtibEZrMTlBU3hCZ3dIaGRRWUZX?=
 =?utf-8?B?VnZPdTNjK1R0S0k5UEpCMGpYdWZUdmtpdVNYZGk3MTdrTGNXZ0owWFNwbEZH?=
 =?utf-8?B?V1BlNUlPMGVQREJrZ3Z1WmpqM3RrQXpBOFZOUXh2U0FEYWpxcUFPN0NVWGRU?=
 =?utf-8?B?Mlc3MUxLT2dBQjJsUnoyN2RMSkl1elYzRUZ1M3hERi9ZS25DQkpJZW4wY3Ev?=
 =?utf-8?B?NU1VY2ZYdStKN3VSOTU4WTVOWmEzNkJLNi9kVGt1WWxMSnJUL0J3T2kyc1FI?=
 =?utf-8?B?MjVpMW9XZ1JUbGFGR0s3YjhOMVMvenZuNkFXSEhHdEJhd2ZIeXVOcERzcHNs?=
 =?utf-8?B?d2dmZzByVkdoSkVlckRtanQ3T1hxOU1pdC96WHlqaXZNSDhiWTB5UFVadkR4?=
 =?utf-8?B?YnhWR2lEYS96Qk5YREVoSCt5enNBRUEyV0d1dFgxSVdmcHJ6Qitld2EwejZJ?=
 =?utf-8?B?MS9kK09wSVZUZVljTjR0bkdFTC9yRytKQ044Wko3M2lkam1FYU5ydUhORURD?=
 =?utf-8?B?SnUyU21sb3BYVjhIK0FqZzlzMnRCTGFQc1BscnRYeTlsTjdLT2poME80MkRW?=
 =?utf-8?B?UVpCOHVFQVFkUlFQV1E1V1FtVkRGRE4vK09zQk9DQ3A4eWZxR1M3QzB3V3FW?=
 =?utf-8?B?V1RWTzZHVFJsbkJRc2tmSXBZUlBtNjVVckVFMzF5Rkw5YkVpdk5yeFUwd1hV?=
 =?utf-8?B?UDdOKzBTM0dHd1QrN1kxRDBhYSt2T3JGV3ZHMDlvWmJUellUM2JSU3F4UFI1?=
 =?utf-8?B?UWVMbUJuZFdmemg5TzFSQnFKOUxZWHhQM0lDQnRaeVNPVmRmWFk0Uy9IVmZC?=
 =?utf-8?B?V0F1WkcrbTYxejV1YTRYRGFzRzAxTWFVMDhHYXZyUDJZcFRnVkhmWkF2Q3NT?=
 =?utf-8?B?cFZkcVdzcjhML0RVSmZCRzJzQnI3NzljVk1ZYVk0RXFUYy9TYUpOQUlUeUUv?=
 =?utf-8?B?anRienZOWUJQQnhpTVZaR2lpQXczTHlqcHc3am1VNTJmdWh4c1NnV3VHSWYr?=
 =?utf-8?B?VnpJNFZSZU5mZmo5SDF5MHoyazNxN21WQSt4YzlaOUF1cFZGU01xWjRmbkVh?=
 =?utf-8?B?K2cwb0YvY21UV2h0T0ZEaEUrZlY3elcxKzZTbUwvelVuMzF3UXYrTEcrTFlF?=
 =?utf-8?B?MHB0UWpSMURaV3Fsay9kNWVITCtHV0R3NTlwbTRNNktPeEtyQmJjTU1LeU1y?=
 =?utf-8?B?dGVrR3QvcHdUR2JBZC93elF3MmRNRGV2MDdVTDdHZDF0YW5jYS84RVdvZWly?=
 =?utf-8?B?YU1aWmpZYkd6TTZmWUhKVHN3THU4NkdWUmNWVUxCSUdIZW9KQkYyQVZ5M0x3?=
 =?utf-8?B?dUFicUsxWmhLTmRjM0MxcGpPVHlORWczYVp5ZG9OZDNwYmFyeUJEN3dYWWIx?=
 =?utf-8?B?blRzMTNTSzk2Z1ltZ3pqMWo2NTI4Uk0vNUFEMjVUcUtabmRjZFhWTlZ2NmR3?=
 =?utf-8?B?ckVQMFhrcWhtdWxnSjFkMU0wZzdydllQaU1VblZkZEY4N21YMHpqdGZxc3Fp?=
 =?utf-8?B?NVpOcERFdjNyZ2tFZFlJdkI4cGlhc0wxWHBvYWR3SVEzem1YdWx4RDZneVNP?=
 =?utf-8?Q?wRQ9AKvs6jnc7bqGm8pdf5Gds9OpYEcj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22abd45-7a1c-4372-1785-08debf751b97
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 00:31:23.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8225


On 5/31/2026 11:05 PM, Michael Orlitzky wrote:
> On 2026-05-31 00:32:46, Michael Orlitzky wrote:
>> Has anyone tried the recent SG2042 firmware and DMA coherence
>> patches with the onboard SATA? ... I am testing with
>> linux-next-20260529, and the following patches from the mailing
>> list. OpenSBI, zsbl, EDK2, and fip.bin are all up-to-date.
> Just to confirm, downgrading the firmware (zsbl, edk2, fip.bin) to
> snapshots from December 2025 and reverting the dma-coherent dts
> changes (e728a57834d) does fix the issue. It looks like something may
> be seriously wrong, be careful if you have anything important on a
> SATA drive.

Changes related to DMA can be referred to at 
https://lore.kernel.org/linux-riscv/20260331171248.973014-1-gaohan@iscas.ac.cn/

Hi Michael,

please confirm whether you have updated the firmware mentioned in the 
patch email. If there are still issues after updating the firmware, this 
patch may need to be reassessed.

Adding Han & Inochi.

Hi Han Gao,

Can you please take a look at the issue reported by Michael and can you 
provide more information on this? For a more complete report, please 
refer to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/

Thanks,

Chen




