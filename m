Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931426;
	b=Iz/KYLXrGrDgbew9qjsN9CwizOjJpwFgBUmipNcet4BzXQ+3mWvGxSWnvm7Iwsw2up1s
	 mZvjDmRNQShGRKwDybvfFVa1adStJe8afO9Il7SmqSgMHOTsDlVjCROS66hBtB+TFP6y+
	 CLx8grvApMfI6N6hmCNDokvRX56MKA7iJVthpQ4cKrBx5ue4yMc5Kkoqz0dzNdYGVsCX5
	 C+KaEHuPNne3NtNpOXHUDItDOvoZHeyQq2smxRZpDQbOYXPMFPx5/bP0JuwZm8PxHXcEN
	 q/0Da01vB2gYWV1aBsGO34U1DHR40k7SxvxL3TEXUpbH6gWI7Y8QeeXY4P32PM5xEVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
	b=RfKMpRrlEsMVW3FrB0P2YVh75YbyBL3B80uZoUSWvUtRe1zwDVTwkuTq3708tOxGRDeg
	 zBPZe6ungL505y6XUxdeCU7OwKcWQPMQCytIyEl/pz/Ze3CFSsuHmFSICQlYjNv/Q0EmY
	 BwhWNJn+30g8ECttplbaI3TYYvxk4st2CTCuyldQh9dUK9yyLRSu6w8AmgtDiHeVTx0CS
	 usQgFAq33Y16P4m+hRD+Yjar3eZJzwaw/Vyp7u/PV3+KoQTl5UnrsNKmcIt614oskVIjv
	 dkeM98N9tmQXcp2hq1Ipfr3Ip/NP48DgaHA9lY2j2jt+RKTKHE8azSeo3h+7WNJ4pWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnoxjMuW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688DB606A31B
	for <sophgo@lists.linux.dev>; Fri,  6 Nov 2026 02:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnoxjMuW
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ec14bc5so33673e87.1
        for <sophgo@lists.linux.dev>; Thu, 05 Nov 2026 18:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931424; cv=none;
        d=google.com; s=arc-20260327;
        b=HgtZ6Ge5eOncLrbOjxDvBGBLUWpG8CzIJlnk/B0dfRIwMJh8Lqc1PB7pYHUS/Hl/tv
         vdjyGi8cjuqzPzOys0J8g2LkiZduJ8UbZrhn/Re+vLnmZdcpwWbvqCJOMRtY86y7lVlv
         7/VZ1e/6y/623v0a84juF7LCxWMCY0rM2whhhlFlfFuk6mFZdT1AytLlDTL/7SRYUkfD
         bYfxlq+N3rt07c6G+RfTqMlW7qiIvROyN/cN83RvdOaygCwoAjyh4NhBQW+h++ynDZpA
         kUTm8fA9MiLt5RWRO3PDj05v5GgMm7/mK34Nai+SSGBgraL93ibHjVUvsHr0yG6LEQIJ
         NQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        fh=uM32r7o8wu3Y2bQhoMHhoCnkgn2ZGBu9/Fo9rQqYONg=;
        b=mTVYUC16/myLQs84qbu1Sb/D5X1CTOKkHwk9UlElWwRexF95/FCLQQw9q0slcZB6OL
         GjKy5/+cqYVlW0sDOu7QfpmKNvplGnx3HZkxi8JMiaMm2lEUqUfzjj4OHdl5Hs3Y1Jen
         wlRuHPdiAck8HAOoV90aUnGr+EzaSRMQxciz+AhhE8TQnPZY/Au8QQwHGxZ/04GWpdVd
         IYqc9DDi4hVFeRN3f/RLOGqdkCb+X4mAHTAEgYAGKzb7h4bkHvUlBQ2ezO9rChct1qdt
         W1lFJzADQYh2eDnac8js/rA6AkfpqsifkSP9u/TB45vKp+KK/hL2IAfPcOTNcmG0z9Zc
         WplQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793931424; x=1794536224; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=QnoxjMuWlEHQEvH/XPL9uT7/YeM8X8CK0gv/mJOCb7u2y95BvSPoX2v3VQ1Mj3X+ry
         0lM+PGiIwArOCr+IlQnx2xXVXB03GhlB/UhytGoW2oKpFqosqMP23ob1jYA9OJxtntyy
         9assn8n1LP/w9L8N7H7VHq8TrFWSaJUGeKQv53fpK6WarW4jRvl7GSeqoeQ+YmlCLUuK
         nqjCgNCP6NuH6QrGfrAYbu1dpjvDOXxyUYvaemfQ8YxsAItsp82Po2jwdXx8AogXjBmF
         i01c6D/Fnk9ARigxX5DjcSgVhVRZm4T8uZay3+LhRmx7nJPcqlunGOhV/VpK1FQeQn7q
         Z25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931424; x=1794536224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=lfcHU8vXaXK5UmcszNKu538CqPFDptmbgGNL/SGaJVWyqxTN9T3x7s3U79LGSWXj2D
         mhepZ1FbzXBFyBGplk6mOXcfNV8K56JrDanPAEk2cYM44D8odZzcHiwsFnQRjuHZQUVy
         XUi1BmdL9j0Gx65g9wvYgsF6YXs8ItqHtjXm5mt185RMtq3Wd6OHeXlR8YsA6K9sskNJ
         M5trG1xr0wXc79o87g1nsY9gMvlgtHcBjBTRrJFL61cUOub8+n+5jWIJrrE3bjjoLOlE
         UlG0Zw5Mx9wGcv90j7iSL1SKlhPRN/GDA78Hq5CThXlWcT1aB3HIrd+eDd74OIb2RjDl
         sAgg==
X-Forwarded-Encrypted: i=1; AKwUvBzS8J5ANU/lLRANtEETSczuq+dy5RimQoAMIsDVS5LaNxgJRZ17jet9M0/y/P4a+fLOKhQLFdU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9I19RfWZKR5PX1+EjOomDOvjWPIDCoRQJuadI4TN/RUoZwOdFI
	kc8HbrcaO+Y+/8JHf3It1vdZZn3aAwIH3RmJY9xaVPP5SgbYos0gwC5h5hd98HSel7njufDNRJn
	MH60jpV5N9umoZdQM5HGOKUFbJoiKHHA=
X-Gm-Gg: AYBFou0Z75c1YDf3hxp+PsULYeqKBpGgWt8ED7h2q1DDMm0xLiujLFXZUGas+dXFjxr
	OrHVRaMdKf5jP+coQEGEj3h9u/uAFnVtoWOYmsMG79var2wlpTGQ6ahwV+JdKqx9QufFbYQ3COI
	7EQxGdSeu7KfqWHFdOeIFIqDKDZzlFfJ6RIXAFZLT5XCoa8OywhhnAgbuWcNrGAbZ+imj/Gi5sY
	P29RkJ9rgoIPAUZSVRuPfKPHylXQGPRV9qAI5tPPjTIoYcGAa2hXoEhGw9qL9IeYYAC+KZm9uWv
	qmGoJ4hWTd8zHSWDRFgjEFa5JcJwHFJGZxqaGLKyQfcdEy7q83NUgoaXeJ2hr1WAZ4Mh4ynUkef
	VwpzkEvki0XoPE+RGA4f6kYN39f5NFORd9dydZpAtVNeGZhafOsDYZ7+eLP/k/HxD+GdjVvf6Oq
	uMr/KNiQkpzZvD/buZAw==
X-Received: by 2002:a05:6512:2524:b0:5bf:d9b4:2481 with SMTP id
 2adb3069b0e04-5c003c16440mr312893e87.6.1793931424363; Thu, 05 Nov 2026
 18:17:04 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com> <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 6 Nov 2026 10:16:53 +0800
X-Gm-Features: AclHuK-dqaISPAtfDlMGbnSeryvn5bwnJRHt-qebg7Qbj88Q7XOH_5ONWOiQpyg
Message-ID: <CAKspUhKv_6BLHVH_5oBsM8UhvCGHEsukRDmMozZEebHZtoJmcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on a Milk-V Duo 256M with the USB & Ethernet IO board, on top of
v7.4-rc1. The composed sg2002-milkv-duo256m-eth.dtb is byte-identical
before and after this patch. Booting it, eth0 links at 100Mbps/Full and
pings the PC over a direct link, 5/5.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
