Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010000.outbound.protection.outlook.com [52.103.68.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D664431
	for <sophgo@lists.linux.dev>; Thu, 24 Jul 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753317576; cv=fail; b=Xf+k19czDL8sETd2MQ7dKTfwyxCJ6HbekUF/AxHlDSoeCqYYDFuW6Ll5+FozSOojyRKciczI4+UtrwDwLchyXLvJHwJ1+VKg9zBfC6T/FmiUW8g2flrjOnBpbmR6d+eQoMBZkgTnJ5Mknq++Ry+oWzXYWJJhA72CVOODXhgX6nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753317576; c=relaxed/simple;
	bh=eh6cx9tYWbVFgHxttbF57a3QqJihZzLmmga/v0QKAoI=;
	h=Message-ID:Date:Subject:References:To:From:In-Reply-To:
	 Content-Type:MIME-Version; b=agJChrX/6+Kk0N+dab8uqf0RmcwCm0W4E8Xi37UXkkTohXZwnAYBrsRLJ+EtNBRjUbqYpR9P5bkvVY/V7crSdf+ddso8lyDu/JutfmKzG8qR1ftBwopbK8Ayxfwt4QrRRKsS94lrqHkEAB8vaDSqXSB3VZYGLn+HCztJKqIWuyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pH8qbfLQ; arc=fail smtp.client-ip=52.103.68.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pH8qbfLQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4WPbYIDQx3exOgvqlSCMyU3WvhSG2DFxzaBSZrQ1aj+iNl1EbX9pcUIDggz0L302eat2jOJ7TYHxb88RnGf7dUYq4iD9fA7/OQN0rkmqmw5NEdZ/MO+Wej5tm/ISvEYUWKkLG9x8C70YVw9cww2XBECdmMh4nRsI1zNkGyd5zEv24q7MlvTIdm8PN19C6ggZrQz+L7BGA8Yanu8pE70UANC4W+1o88SOOLkX2kdaUsLcKI1EiK8/Ynyc2Zx/7nN3EcxIMjjGIy1+kYlGsE0+OWpxZ1ZvQLYUdUuE3htNPjDEGu2tXH0HRWjqcZjMkQePPg+1GbAqYzliw+i3a28pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTnZ3rvfMrkKk+QyRDXB/G8gufuv4dfeJUs5WjHhuq8=;
 b=NjjZoYi0qMgxbf2NUJTxhGRwftLUbyWFrrO70v8Jh7blP2HBGAy5QkLdAy8cAQ/20ZEtzb1VkcUnwzOL+/Txo/zEPcDt+YwG5lcqUw0gp4fav0OkL1MitTvAFpSJMGXqE7++EzJj90bx6BQOA5HQLNxeprLt0+t4aHTno/FEktcQo6SA2byit35sxj9lctzUUJH/Y7PyQI0K3CV6L9YLC+n7SKsuBeHMetVXi3y8J5hcY7pKjvX3u+Z1xlXtljX6yp7/o73bT4dlNmM5oYNLwnjLrx+mSWKFFs661xxl9w2Z6uiVRn1+e6XFHeFmxlLotWAXUrTWLRF6Pf3C6ufTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTnZ3rvfMrkKk+QyRDXB/G8gufuv4dfeJUs5WjHhuq8=;
 b=pH8qbfLQl+sBAUBiCnmoJxCGB2+fVnRNNSFtX6t5m3oFk+cBJqTV6I3euLFc0e5u2gLu00l4l1KqG1tdszf118FU2vikoiT8G1VWsPlSC/OGIvgWPv7iTFXYoWtBa9F/HIMtb6YiHPTPCKIZc4N1+akcDcB/wmStfE1QyW+6xY35cGYO5r1wpqWXCuGQwKCSiiz90iZ7CiU/KrvVFRsjwKE6JQ9o/uKGc0wAOxlFQ06HyY0xI3TNFxeASXETfGXMtLjT90a8iHROdnPrUHghfoIw+5oz1orPn5hTN+ttxIOdQw5ONyhr0sZK2blyfZIWIS8S1LTS+aTag8cF42/hhA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB9275.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:11e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 00:39:30 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 00:39:30 +0000
Message-ID:
 <MAUPR01MB110726B8C521DC05B1551DA51FE5EA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 24 Jul 2025 08:39:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: [GIT PULL] ARM Sophgo Devicetrees for v6.17
References: <175330321699.1775141.6908282038454738155.git-patchwork-notify@kernel.org>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <175330321699.1775141.6908282038454738155.git-patchwork-notify@kernel.org>
X-Forwarded-Message-Id: <175330321699.1775141.6908282038454738155.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <83657c64-0be2-4ea7-8893-18091f91162e@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: cd092f3f-1913-4ed8-ff7b-08ddca4a8d12
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|461199028|15080799012|8060799015|19110799012|4302099013|440099028|3412199025|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckpWblBra2tyaGQzOVBWTE85bHozR1lUVnVBR01UME5UcEZVOHF5am1BL200?=
 =?utf-8?B?WWFxVW5STGEwVDN0blk0R013TEJkRGkwNmZnVE8ycnNZVHFnMkRML0ZNYU00?=
 =?utf-8?B?Y0xYZWJ1NHNrMmdNeXRkWk9LTG9uM2gxbFpZaUtLWG9TVEZIMHhKWmtNeXc5?=
 =?utf-8?B?eUcrazZUTmMxbEcxb2FDVWp6a2U3Z25Jc1RLS1B2eTNtdjhxeXNUSlFVdEdP?=
 =?utf-8?B?MVZsS2lMUksydWZBME1JR0ltbDZlMDlkMFBGMGwrK05IeWk3WE52bXZpU2FQ?=
 =?utf-8?B?K0VqSDNGNGRMLzNsTDRKWHpBUFJ1RkZmQUZHUDdXSzVaTFhSTStEallZampE?=
 =?utf-8?B?SEdoUENiVTNpMTcveGFkSXJrYWk4WFI0c09yRmd0QTV4b1l2RzFrUlVLdmJy?=
 =?utf-8?B?S1plUityUXZxZlFzdEZQc2dVMVlma1dWUFljNWFzYUdJR1ZkVlFLbU9xY2Mz?=
 =?utf-8?B?dUUrclpCb0p5OGVabVNZbWF4alB2YnlmL0NQbzVlMFZHbFR4MHdIdS9nalRw?=
 =?utf-8?B?RDNhYnNabTcyVGZPVzN5SE1qRFd0S2xGcGxubno4bkNodlVHSFc1N0lFUXgw?=
 =?utf-8?B?VnF0WGcwSnhFa3lOUTd2d0NpcDZYVlhyQWMyWm9mKzhPOTEraWR0VSs2Q2hU?=
 =?utf-8?B?OHZSQ3VrOGxYRzFPRUNDYUdNQWJVRk5WZlBBc3RnSDhuUzNJZTZ4N2dSUW1M?=
 =?utf-8?B?NGlFOEp4ODdDNDBxRkNhcEhBYlFNcEk2RmVhSEd6d1FZMkxlT2k3S2pva2pN?=
 =?utf-8?B?L0NLZ0FZUk5BclFMUzgvM3hMT0tJaGphUnkxaVg0T0xlTWNvVHpnZ0RjSHIz?=
 =?utf-8?B?V2FCeWo4aUtJVXdGdXhXYk93SUtsUnMvMXBJb2xJN2Y0NGJqR1NhaUZxMXRG?=
 =?utf-8?B?Rk9OMkI2aktONTN3MnBFZHFkOWlqRlVRaG02SjZuNFpoWkIxZjhneGtxZEFk?=
 =?utf-8?B?SEtRZDJxQy85WFdQbmlCN0VCVm4zT2ZaQjE5RFFhcFE2L0U0R1ArdEJsK2Y2?=
 =?utf-8?B?Y3VzMkpsZ1NPeXIxTjM5U3lxOUV0T1BZam81enYra0hYNkMvWUNDSmdLR1lK?=
 =?utf-8?B?eEwwSldxQ21kQ3o2VGxUL1pXNnQzTXhVaVJQWW10a3pVVGJQV2NyQmE2Y1dU?=
 =?utf-8?B?bHNySjBCSW1NOXZGVTcxMjdJN3lrWWV4SEM2VlN5b3NqUGpMWEpsVGhDb3lF?=
 =?utf-8?B?NDB6d0hGdHE3eDNsZU1NZEhBWGxMWjVSN1FsR0Vna0lUeTRWbjB0dHoxTS9Y?=
 =?utf-8?B?ZVNDM2o0d1N5emxyWWZvUm1FSTVDS1pZTmxzT2Q3VHM2a2NjekVEdktmRWta?=
 =?utf-8?B?L2ljaWlWVlBvc3NIa3JOODdZRWM3bXdUWkIrOHJvbmdQdk1VbDZmYlZuNG55?=
 =?utf-8?B?elpmaDZMQXVoNWxiVUFWRnZNRkZFNHZ0aW1oazlTb0w0UzIrbHVldE94L3JH?=
 =?utf-8?B?T09QNk0zck9XQjhURC9MdlJVeVNsY2RvMjlTMXpTK3Z2Z3JhZVp3bnZUVStq?=
 =?utf-8?B?U054bkVDbFNtWlVoVXdnTHhpZm4vWHRUb3hZdi9SRWF0aFlrOXd4b1p1SElB?=
 =?utf-8?B?KzRJYzVuVGhCT3BTTlRQWkNWR2JHUEUrbmc4QiszNEIzWDl0NEJVNUJYUklS?=
 =?utf-8?B?UTgvY1d6UXUzbXo5UldDb0FRWU1XWDRSTXRUMCt0bXZkaTVNb2R2Z1AzVHNK?=
 =?utf-8?B?ZUxxbGRDR21EN1VCVm1rNDhFcy9EcnMySFNodVBDNCs3eDJkVXJjU0FnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hHMjFjRmxYZGlpMzFFUEVqUkp0MTFOT1NxQjZScFp4ZG5HOEwzMDIzL1dR?=
 =?utf-8?B?WGlORHlKUkRZV0tiMGMvaHFFTG9La0tYck04ZW1sM1lVWXFZa3lJc3RpRUd5?=
 =?utf-8?B?aGxNN2s5K2NxSEI0Zkt2eWFzSnBpam9ROG9BY05WVmhaZ2pyK3FzWGgrakwz?=
 =?utf-8?B?RFdhWmRZb0V2NFpVZVJCSmFiYWFocXFpTG9nU0VmdmRYTXZNSHp1Y1N6d3dw?=
 =?utf-8?B?YzhDSFBrb0s4YzRPdFpYNnIxTXJRMUhyaVJEaXNnbmFUNmVaNlRzS29kM01K?=
 =?utf-8?B?WjcyOExYMU1FZmZtcWN3ay9ET0RFVDgwSUwzS1BtZ2tnTlVzYjNDMHViR0wr?=
 =?utf-8?B?MHB1Z09uTnpJVVZYSjM2K3p1VDUvVS84ZU04bmRKbXVLNnhSa3VQR1hCRy91?=
 =?utf-8?B?Y2RQckVmMmR2dWNCT0VHY2ptZnFlWnVjZ2pVZkRGYjJMbkRScUpVVEgzR0Fm?=
 =?utf-8?B?M0JsQjdGeEJKWFkwQ1lRNVRaS2ZhUVJoeGQ1eU1JTGJ0Wk1IbGFyQVhKUllh?=
 =?utf-8?B?d2RIL2FZUUlPQkhnMHFZcis5dGRiV2RzY3RtSVZpSnZRbTBzK01RSDFST21B?=
 =?utf-8?B?K0JydWVzU1FmWjB5UWpoRnNXSWs3UjNldzY0cFRoaWxQS2VwMnE5WGVqQ2la?=
 =?utf-8?B?WnZyTlk0S2ZBcWt6b0Y1ZE54WHNXa1ZDSGNmREJ3OW00Z1Jkb1pReGdOYkRV?=
 =?utf-8?B?akdHQmhMa1RsY1ozTzlsdGpWNVpyZG1mcHpNRjA5MGV3dURxZVNlN2c0SUsz?=
 =?utf-8?B?Z1o2Rnl5ZVFBZlZaNi9JaVhVUHdNeWlEb0JONHNCSzJtdXk2WUpxYTMwbFZE?=
 =?utf-8?B?b2RtRjQzSnYxUlQ4MGdIcnBxU2lKbVVTdEZFaFl3SmR2Z2F5bGdHMG1PTnRx?=
 =?utf-8?B?UUUzdmhmWk9aU2JoQnJadUowYXpPRS96VElQRkU0NlFZRndwTWlzTmhtWExr?=
 =?utf-8?B?VXpYYUJUOUFzdDk3ZDhCNnVsTm4wTFJjamowUWI2TzczbWNLejJSeDlHNWth?=
 =?utf-8?B?cEo1QW1KZk9heTdWVkcvTzJ2bHlDcllkVjJIYWVJWFRVb3djZnJoV3dOZWNz?=
 =?utf-8?B?Z2Q3VjFtdDRYYnlrTE5Ra0hzR1hqNFYzTTVkM0dvZFVCc1VieXdMSVhFTFdN?=
 =?utf-8?B?endyUnNmdVFSVzhMeDhKbDRQbTdLS05ZTlIwNlVtUFF3V2IySUEwcFJ6dmhW?=
 =?utf-8?B?ZkJZKzRjckdzaEw5VDJyb3R4eTFEdllzKzhvZTVKMitZV0J0WDVRVkIzNGpm?=
 =?utf-8?B?aGZ5TVJkQWF1Z2R4SjVrQk1CcE1ONzgvUzJLRG91NUgzblI0QkFVS2Fla2V3?=
 =?utf-8?B?NW4zbXhLMkl2NjlXV2dQbHJZQjZ0R3B0eUw1b0E0M0kwY0VyM1NWcW5ZelJ4?=
 =?utf-8?B?TTE5bkhpSkJxSHZmVXJCZElZUnJxdld5UlYrUXdkTVN1bEYxSnRvR2F5by84?=
 =?utf-8?B?bDY0cHhBckw2MGJuVGxVSkl6eEhiL085RTZDamJUZ0RHVG5yeUNnamtPWVp6?=
 =?utf-8?B?T21DazNKMHlCaEtLQThiaWhNbzhOTmYxUGNlL2tWTlVEa01peUZJU2dvVFYw?=
 =?utf-8?B?MUZ5aTBwWGRGZDFlRWJhekYycEpHM0N1enYrM0VOWUtQZXpiTngxMVp0MUMy?=
 =?utf-8?B?cTNOb1E2UlVucTJrM2hoQlRrbFFTME9PelpXN3l6K04vcWE2ODNrOXdjcDQ1?=
 =?utf-8?B?V0c1VVBLb2lqSk5hSzdxZEQ1ZEpWMTM4UU9NSlB1Sk8vMXlDSEYxbnBiUTdq?=
 =?utf-8?Q?QK1ZLr6fN9hO6gDAN2wgxYNUxHBZvQujXbgNeoU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd092f3f-1913-4ed8-ff7b-08ddca4a8d12
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 00:39:30.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9275

FYI.

-------- Forwarded Message --------
Subject: 	Re: [GIT PULL] ARM Sophgo Devicetrees for v6.17
Date: 	Wed, 23 Jul 2025 20:40:16 +0000
From: 	patchwork-bot+linux-soc@kernel.org
To: 	Chen Wang <unicorn_wang@outlook.com>
CC: 	soc@kernel.org



Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Jul 2025 15:18:21 +0800 you wrote:
> Hey Arnd,
>
> Please pull this dt changes for ARM/Sophgo.
>
> Thanks,
>
> Chen
>
> [...]

Here is the summary with links:
- [GIT,PULL] ARM Sophgo Devicetrees for v6.17
https://git.kernel.org/soc/soc/c/05a623030b3c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


