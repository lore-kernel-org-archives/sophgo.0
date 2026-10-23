Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769213;
	b=Q0CSfJaccwFPvNKbDWz+LyIwzBbmuprOuct5jsHw+WUOIDcHyc8k8Kr/O6uZo3r/ioSp
	 hovnos0g7392bh8jaDq8O5brDdRdECncDPFmAufnncfXHndxPh8oQY7apv/PuCl29jDqG
	 iEKAPHKg9G/BaitIWaiXeDIZzD63OQVa2DmZbuG7LjSpOKGdef6qvLhzFNBd9BvIWr3Zb
	 wySQvzYsxz0GthLUhsmffkJN6FdY8beu839llEI1FscrYXeNcSjSo/v1jKn/TC91z5YxX
	 Vl7q6GXiBpJzTDYe0gIynljOEYiU8XKq5/ONyEo1Ms9F5r5maCXFQx/Dfat3iHQ47sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=u0hDrqSPEdKbRaWfUfSaJQ7NlpJS+R1LzsqEJSfGOug=;
	b=r/L6VmQvyZ9Slf1jmaSPkPqXv6mbbN8x7Odw8lknYlX0FuKHdOemKvS6B0p60sExei/S
	 9IYT503S5KRSfYjoLAmxkfW6pe6Xv2zi2HCTjo2PTr/W5K1WBPtp39LIxuqoD6+KFW8fN
	 6gfmux6f5qTT29Wh2lqPnIItuGpM4a43pEvgAyLb1+h/lWaR/sbCBEP3qNcxZABA+tPAJ
	 EG/eNOd3dP+hQzEEhk73CKLN0X6NM6nU4Zr5L7bE4wo1/zwVZmS9x0wGazSTsygoJM0LQ
	 HBebktVDrUm6O5vbqEeQ5Sh6QteZFQwiQY8jI6GAMkVI0a8QdxGwwI8urlOS3Qzsgrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UEaDjmiS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B82606A31B
	for <sophgo@lists.linux.dev>; Fri, 23 Oct 2026 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B82606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UEaDjmiS
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab30d04674so1192351fa.2
        for <sophgo@lists.linux.dev>; Fri, 23 Oct 2026 08:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792769211; cv=none;
        d=google.com; s=arc-20260327;
        b=EomJL7ZkTCnN/k6/noo3rmtIUzPw4P5koo9j43kfrLPVX4uTQUeKV3tzqw07ZrkoXG
         9VUcXepfglmHSfjWB+tBe1UZfB9O68+TH0jZ2RxGtGgYVdgrrcqCvMXuyUUQs7AxOAZV
         k4s5r93oltaZyTevQ8NCgbUYMlGntSsouzSR6hPaAM/nc8zZTOyFmC4DhM6JVOTX7xXv
         btWggvm1RZ1R6B7CIsrEadZDIV49IsUY9cxHCl5FRpaEuFoPRVZoKGuyKDKCW58m4k4e
         URI8JNZsbGcMx3W8Vk7Wf94rmxDsEkQiJP+wY1yKVOP+JZkC7cKV1I9jpz2VOMcETJu0
         H5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u0hDrqSPEdKbRaWfUfSaJQ7NlpJS+R1LzsqEJSfGOug=;
        fh=R9yo1Mor6kB+d4CsJuLYhhcuIg+/3DveANtd47vP/LU=;
        b=NOpYGX9ja+zdabtemU/a6YXLpGE0JL2lyoETbi6qgLXPaogcqRlB6PhkWlWtS0UnHj
         JDppMD8SHYmtLqbyQpSV5/8fN8sWDP/Yak/sQ2tDPjuNE6NuG/kjnWlbPIVwO4PFTdaz
         8Bm/h/yctJ4aDTiwlgwXy3CT8pYteYqFS4ISeypsaJO71p3ZWB2ajRjz6URZzysalOAC
         JvLAdEJCu5bpSeE/nnwBBP2PGJZUwZT2f+oSvM8vI2ZY2d6tRd8coabqardXXrN8Yhh+
         zYYz48NVhYhCvKAuze2AQXMS+o2BryRqJ8e+FAVcvGg4GC0SHRGtiYVvT7ePeUslxBHG
         X+ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792769211; x=1793374011; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0hDrqSPEdKbRaWfUfSaJQ7NlpJS+R1LzsqEJSfGOug=;
        b=UEaDjmiSnjvZXMkmG2bM9JQ+wprMlB+qP1YDmFx06wka07myP7wH8aqbLLgeQ9D4t4
         XQ7oei3gWK/Qbo5SD2UTrnLl5HOjhSUaa5qKxBq8IxhGooWve7SJsfjfVN5c8eQPwMqR
         pghZg4wD65et0inEKGRpz5v8SfhyPTU1JqJpNU3AMuz4hXPMFUO32A/nIwcLCch3PrnO
         /Ot0jhDKLlOKC5KCYJWVTLXJdsGicK11kQ2NghI6yoVv4dukvxOOeIpq16yviKOTUC9U
         UUWi1/D8kiv/HtE9JNM9m/vNKXV3Kv3hdDKJGgI7KW+LKRBy4HQsZU1cQX0uNOAXc76q
         t5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769211; x=1793374011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u0hDrqSPEdKbRaWfUfSaJQ7NlpJS+R1LzsqEJSfGOug=;
        b=j6MXBxViTQ4+AflqwfuDtG1qJXS8QuxIAVl0GzMfy+UdrEONYNzwCL6xuXUfg6+gm7
         KmQ6CyQOWpgfmYY5hHq7u1/lVTIiqqj4PWvhFdGL1vwpabb0KE/HAq68fOAZH3MHagjn
         2N/8u8jnNMU8e5bKOEwRBBnF+/ZDZKx3BTXDtPWG8QI9tjAsrF5x7q1QOde02ZpDTglW
         22LMi5I1zsBMZwHHfFSgl/fbJCQe3lzM4zqVYhMYwbYmwsXA/F/fExtE5YFSgH/GIfha
         /8Cpsrfl6DuMknAaaiyp9Hhmo3Qh20zyyYUfTRXJO45d2uRvvaR51PWaXjCQjPjQq3XJ
         gZIA==
X-Forwarded-Encrypted: i=1; AKwUvBy1D/AcnK6jlxWLu8G4iIDuyyX7v06n5wpYjJIAuZ4lHGt3CKbZ2pKqQobVhB6GPW1WDP6pAj0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIi99pX1Y18qSFcMGmybC3ESDk0EALNz8O+J3dmB7Dun3fQLG0A
	UWra1hkI1Utvo/38XLOUQ4htBAOUQoq5GhhGDqjz2fXF8dkGfB75dURswMnyf+Dd5x3h4me8R2A
	GJYZSVhWHB85zegtqrDu3RD6F3iaEqvQ=
X-Gm-Gg: AYBFou30mxwAa2gzzoUwX16XavVMFs6+PMgrBrM6BBX+QMxzRdBg5kVcStSC+UasyEg
	gV78Lwh5UpE29vNVgyY30M2PT1rzUwa5Zy3Lsl2TJsm5ivZQ1rKWSPW310VwCSiMtVVOy/waFO5
	p2NY3lBYxq74FFINS9vNWf1e/0nmealfFLZTYsc74eKK9YQA9Ao4sp7YMOyVenoKfWOONSry3nI
	8MfNirzSf33LBPOq2gd29WCwuM9xZEwFmv5pPJkjo7iF2W3MWZaWwKlL+8ufeWStStW5f2Z+U5a
	hxa8t9TtQSLX23rwdirnNb3xukrZy06Juk2gHLJhpm1AtrQIB4b15tzgUozTK1OLsDbujzFF1DZ
	SiGHTGQ5ETJVBch8ZRL3V8XgdOA2lZhY9h4vtC5l4MsYZl3cZzkTSY/2vB1W0/PIhgqmlFIPjTm
	aJgc0dqe4fqFCvvXT0c64=
X-Received: by 2002:a05:651c:a204:20b0:3ab:1d67:caf with SMTP id
 38308e7fff4ca-3ac6619987bmr5429791fa.0.1792769210800; Fri, 23 Oct 2026
 08:26:50 -0700 (PDT)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
 <as802eClIH7MpxBR@inochi.infowork> <as-_ZlweuKWU1dsc@hiagonb>
 <CAKspUhL1HMT14JZARuxnoh21+mH+7_9rJRggqu_s-t4_CZB8PA@mail.gmail.com> <1036bcd5-09ce-47f0-855b-1f1fbf248825@linux.dev>
In-Reply-To: <1036bcd5-09ce-47f0-855b-1f1fbf248825@linux.dev>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 23 Oct 2026 23:26:38 +0800
X-Gm-Features: AclHuK-Nd-9cQtwmPhyNY-OK3ZNcdS5QTmLLw8K_-egIf3uHrkJ8X_uvVI7bc3c
Message-ID: <CAKspUhKLD+dCXxtY+hTCGL6465YpeSAypE8dncEH28YKowZusw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Chen Wang <chen.wang@linux.dev>
Cc: Hiago De Franco <hfranco@baylibre.com>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hiago,

On Mon, Oct 19, 2026 at 04:36:31PM +0800, Chen Wang wrote:
> Chen-Yu and Hiago, you two can discuss it amongst yourselves, just make
> sure there's no duplication should be fine.

Since you already plan to respin after 7.4-rc1, please go ahead and do
the merge yourself, covering both boards and keeping the current -eth
names; that keeps the two of us off the same files. I will review it
and test it on the Duo 256M with the IO board.

> Are there many expansion I/O boards currently on the market for the Duo
> series? I'm not entirely sure, but my suggestion would be to avoid
> adding too much support for expansion boards to the main codebase,
> that's something best left for others to implement offline.

Fair point. The naming only matters once the USB role is no longer
fixed to host, so I will leave it out of the merge and bring it up
with the device mode work instead. That is about the board's own USB-C
port rather than an expansion board; I will send it on its own once it
works, with a proposal for how the IO board setup keeps working.

Thanks,
Chen-Yu
