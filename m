Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59342346E7F
	for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761829118; cv=pass; b=axQv9o3iGaw90Yc8At9AGXuWHfHsLrcTQUiSOLfKjbobv5WwkRB4VDPR838ohQ/fwckoBt2/OjMjGBCnyefmVYKiUIG855Pr02DNcMe7McPUJ0qIffmIsEvF2sew7/TX7nkS7Rm25c0HzD7bREzPK1bESyPBupGgxMh++mdY/xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761829118; c=relaxed/simple;
	bh=Rx2qsb6wDIopEJxrX90NnXv9tgDXlNnqAsM12BIWFpY=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=Kch+c0N0P2ZXLSWYcwUpoWB85iy+ETkBigfp5rpN+12SvjBgoSzS0/4olZm0cVxxKB3K9BkPXytpJ9VzyLzu7AsyK8F0Z8ew5/yp6eG3lkp/DRx7YM7Ul5Iv/0pZhU5XPIs9GGxxGXjM7hGXN2R0RgslY7S6wkSwtfn2KxXzJu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=D0eda/wH; arc=pass smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="D0eda/wH"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 776BB8C0811;
	Thu, 30 Oct 2025 12:50:09 +0000 (UTC)
Received: from fr-int-smtpout16.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.124.162.95])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3ABDF8C1FCC;
	Thu, 30 Oct 2025 12:50:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761828608; a=rsa-sha256;
	cv=none;
	b=y34sBHE5oOtQ3vZrXxjfFAHwsCRLhVkzy0mansGrQx//f4+8uDiMx1jVfxvYWTjEUeiR8t
	NeZ6Jp/x0y1KPbYO1XhokxoSXPZFlMVi/C4SLruCbYIea6chTN2BouI+sduTdQHVmX/Bl9
	PyQWl7UCePnECSB1j06LbbVh9lX38+n0S7j70QWbmxjLIwMigbJQy0RHpxdd8eVEahZgnL
	p4082B8YAB2veE9TuDB0GeqYersYrDlJByyV4rdY4Q898czaubIVfUEeSeja850zwoiYPU
	+/5keTbEflANU2oXFsvdi702u8huTW6CK0r2F4sup4q87eictEV1U7eauBgpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761828608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Gz3xQ+hmZGgEDLHwvY3zzhydvK+yGJ/MdRVQe4JZJGo=;
	b=5OQuRYFcBL/vQljZA0nyxz9w0K+bjoOsOb7oVzqN/WzAZBGPZ/vHy/+xeRW/ukmDYj1EBj
	Yx8Evj72sa9FgHjnbSeDUdE/HP1ItPKQ/odhH9l1NJtgrTAsfg4Bh8SUrFzKh+1PLkvwq4
	LAN5+TYucEN9dIQfLVDQb6TVTXKVWAzvZ0s21aEmvsOFB4M/UqFW/U+ZiBaLYaVZkiTf9F
	1TW3T1FfOp3x5zolu6d+Jl4L7TLW6YVC102b6L5EIx5ULXPznjmcEqbwbCOrwJBNxsD0sz
	XF62yg5V4qKceDZTm0NKnhcFrCs1C5gdai7B79N3qu84xYjjOmtjOlXiG3pTeg==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-j8sw9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Obese-Gusty: 4d5da9715151f960_1761828608645_2022255201
X-MC-Loop-Signature: 1761828608645:2649050027
X-MC-Ingress-Time: 1761828608645
Received: from fr-int-smtpout16.hostinger.io (fr-int-smtpout16.hostinger.io
 [148.222.54.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.162.95 (trex/7.1.3);
	Thu, 30 Oct 2025 12:50:08 +0000
Received: from [IPV6:2001:861:4450:d360:c0a5:3392:2a75:70e6] (unknown [IPv6:2001:861:4450:d360:c0a5:3392:2a75:70e6])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cy3qF4xcDz1xnw;
	Thu, 30 Oct 2025 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761828603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz3xQ+hmZGgEDLHwvY3zzhydvK+yGJ/MdRVQe4JZJGo=;
	b=D0eda/wHwY9vazv1OtQ95Hg7X3tM7MUtG5e8JpkWV/f+mqXUQ3oJ6YjPHLtwjh/0Wpg2eI
	AfzptSgVexOZFna7mwcN1r/Pr/zlacsL1v5QGUWdht0b2l08CT5MmatJi7IL8qtcj1w7o7
	2o3FfIwDqVlxJvh4Wa276E/zCFUNPn5veyDYUG/UfVKBdtUeXLTPHWPq9sQ7ENbX/vdLpQ
	NIUMPj68ZA+ParyFxJs3Cq2v4sHs5pYu3LdLDMi9exAGFHePYQtIqwDtoDjlgbAiLm4jHj
	cEIfzXtyRFjYRC+ZES2Ehs3RPOxxmGHvHr6nKniRRwhXnr3vNmHh1sh8GGZNOA==
Message-ID: <b81536ee-5acf-4308-aa22-c374c4a3b8f7@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Inochi Amaoto <inochiama@gmail.com>, Joshua Milas <josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
 <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 30 Oct 2025 12:50:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=69035efb a=oMt8lXEVxmMAvUTv2ASLGA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=qwwWCKxYK2TD6zjFQdwA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfNwpELjTKPpT2hRmqJcNaPWk81N8hSnY8Avz0V4rzyS53iFZkWJTT7Pe/VnUWgiWXf75c7PedFqG4YtNsCCFz9FBxE6WAyWJcIUFAaSgGtJrYxd06Il3 eXkCsPWR4B+muheKfLDvKNJDEh9xd4Z/9z40a/s+ngnQfXEfWxfqppYd1DcI3xZ57V8fmz85KeksQ1Tknsc3+skkLMasLVwVmUkpExW1KkgSlQyTbzCHeK54 v05gKnX6moG1Z7D5KBMgaETDP5KEfeT+GUl3Lt5rmsHaIrZn2OfrKx4OCPWhQlFOK8dBxPGiNXYLqy9I7U+RaDaZ7L53K/nMYkI+StWqZbhPL10GnuvjfObH ERsRgRRVu03Hasaxe2tIHRL89dCqoRPCwBPpGJapaEJlEdC/0yn2N4XFcgl4x1hloXyOWio7eCVcKaHfj0XngffvzJ3Df7RRQrxNwhGKBbX4d5oZFSwzNPxh zAAjD7MenjfzXT8FGyygcQimLTCga7XBFAb6lJKR6TQ2n2Er4AGjQLdyGZY5r30V/hEiH85iHCMH6MYcH+yh0Y5RsxpOg+B78eRskJ8B2ycUcS5Fp0sm5XOk F4xplmp3CwZ39+vEvaPRm4vZ5s+UKfccoiTtEowgz+29BCplw5kKBP7zcZx9EFTeB2sHYAr4WtnUww/u7ZEb+N4iKusQUFOMQVOe+srsBrzdCh6Bbo64TROF 4t+srDpziUQoaVBkVkPG9yGtLd7SZGp8yafhi2j5H/YznwyC/2uW2Ye0uBqIQtbbF0HiiXVx5dcnTlrXbMyMRm0wFGUVTWWog/fOlKZDUAvhjHUjryGE0ZL7 ye+kobiDGJVqj1c5owdFAAtE8yFGE1JvF/BLK9LhoM7az6nIeVNLxb1X/jJHxkAmTLaAUKAvAYjLUBClrR+VvCeyO0GP6be5l6L7yBfg15eo3h6tXo34H/tD n4NZ6Q==
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Inochi,

Thanks a lot for the guidance!

On 10/29/25 01:53, Inochi Amaoto wrote:
> In fact, I see the maintainers do not agree adding every possible
> configuration to the DTS, (especially without "omit-if-unused" flag).
> And in many case, it is impossible to add all possibility. As a
> result, I prefer to use DTS overlay if there is something custom,
> and keep the mainline DTS minimum.

I guess you meant "/omit-if-no-ref/". Good to know!

> In fact the priority is the thing that is hard to decide. This is why
> I suggesting keeping compatible with the vendor kernel, as many people
> starts with vendor kernel and it is a good thing to refer.
This makes sense. Thanks again.
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

