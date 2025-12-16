Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13933FE03
	for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925123; cv=none; b=Sgjs3L2cNJrCopqAgGdVrHJB+9Dx4unW/9PXqQsjkXuZtg16LCVDyE5OA1uY0IrJm3RpDZHV1urFf1bdkgRQIcVox7ZiFBduEJav86dTs4FeN6ywd4tpXuF3Q856iwgplpEbDHTttC/kl4uavbVS8h8Shx9upTnFkLr/CVX85Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925123; c=relaxed/simple;
	bh=/ns1Rp/WSyMte8FAqNCkjuzh1ej9BUVs0MBSnMXCYb8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwVCtBzEbIBxlVNCz4HL4gy8q6Gxox/VJOjN4B6dSLIl+NCXjEwxdSQUV7HM9UJ1vU2gHuUaiHNKNzZ1o4YoQLPcv+hUKq4BeTRzH6blGVgu1DY2Fyj7Het2RiNq5h+jQAoGOVv8GCLU+DrgHztZX3oR6+CoQEym+MYmoPQIpdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxlCTRBn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxlCTRBn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5543963b3a.2
        for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 14:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765925120; x=1766529920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7nXoigv9/yz61HlMjawiCb2Rzy4kdcjqDMu4uuBc3o=;
        b=OxlCTRBnr04ZmL9WUw0TqBDmB45UBRDqn2DMEg4WPUzT/MzzJ+A8hllcC1/csaTd72
         ohw8J00ws/P/Ffelz3QkewLx7X6yDod4dzgXDaTq17c6rDFkgacwnzvVrXueEZqHA+mK
         Qr13LKE9hNU7u1WX2kLDi29p6otFgGy9pja4saxAXxpY8R3Vwe5UqrjoCoKGQtu70IWv
         x+PZBSZlmAzk2FN8XTjrpuwJRnuEeyvkPuQy5ZV9el3NxGRSc7UOWeNTzHYiX33HYt5/
         cCb+gE5U5rrt2zdsmvC9OfCpo7RMt3sddnKnTZF45zSV7sCzPCJGwcs81NZjqAXF5NkJ
         LDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925120; x=1766529920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A7nXoigv9/yz61HlMjawiCb2Rzy4kdcjqDMu4uuBc3o=;
        b=wuBFwVjQmTYM4gustIBuad1OCF03/OAoUHI/8EyYAWDvaEuyZlSo8iTT0l7WLgH2In
         vATag914oAug1i1iWWbxCXLPvAW4HeMnrbt2eoigTnRs9cuy5rEPQzCbZky90FuZsAKL
         /03F+dVwWLACrnwqeRDE914hhmHzOfacwcDV8mXl/PZS0rxEqAyKt44jD1vPsdnHyrRG
         kjxUlgr4zwtBgvNcK5RHaY2p/KiWseRZ0pWtXkLvgdTt4brptK+wE5Zz63TMmcPCzfzJ
         yYXwfyufvQOmNtlmD6Av4aKNFJfo3wmxWbNFlE9tRMBPNtmqozBtDOhX9hIak6+W52Ov
         8s6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQljOOXB0w6AwPE2Zu/+rpsLNz6LhGtWoTJDmqlgxAINYXftH5qPpl+PGuYY56opdun5RBYA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmOhMS+lpMU9VOwSRK8cXRDAWC0ggeLOSf5MrhaNBLCYj3HMJ4
	3YE1Igk66i/URNrYcluf1Oa/zzmgf0YOyGaDHg8+gruxaJaQxRREfn2K
X-Gm-Gg: AY/fxX4phKwHnTP2Z2uhec2w8hjmRLFl/blPYa8QXi/SspROMxLZfpCJAPV9H4DCc3e
	WOXFyT+y1NxvD+Khafo4P4WyzxUWiRu6GkU72WsgOpSLGGVj4oFzQSJrKY4nQv+WOVtTe7I+y4s
	+bpzgLJgAQ9uLZff8QwgvokZROba2sqjMasZ3wB82N/ludkftRXZbX4+KpPP24Iibc8+Ro2iInz
	PhNp7W1Z3n4U7s/scT+7AfkO+a5B2/JhvGG5p3lwhqS/+NmMxIcHfRWWT/ecsORK3/YDbU1yR7H
	u/9zm5Mav5O+bKVAVIyhLty9b4ia64LxpvHTzni4D2ieANz4S0Im8+DAdbLqLtJqpBWf+COk1SH
	xKVNvYNV9TkH1d3vyvSjpN+Hbr6uym2YXQ5PpoqL+8JR1IEh2Q+uVGpre4Kl3mYrjpBQF5NkuJL
	hZVn/w/UDjDQ==
X-Google-Smtp-Source: AGHT+IE9nIlDHsFmfYsacNR6G1ZVOO+zgg/tDfoQF+xuebBoHAyCLps0J4BtB+5eml9RBwlgxvUP1Q==
X-Received: by 2002:a05:701b:2719:b0:11b:c4ee:66b with SMTP id a92af1059eb24-11f354dd89amr8447143c88.37.1765925120396;
        Tue, 16 Dec 2025 14:45:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm57479374c88.2.2025.12.16.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:45:19 -0800 (PST)
Date: Wed, 17 Dec 2025 06:44:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUHgt8caOoo1gsES@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <aUE9hDtflXpcgGnX@inochi.infowork>
 <aUF4w9sO5lmU9T6v@anton.local>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUF4w9sO5lmU9T6v@anton.local>

On Tue, Dec 16, 2025 at 07:25:06PM +0400, Anton D. Stavinskii wrote:
> On Tue, Dec 16, 2025 at 07:09:16PM +0400, Inochi Amaoto wrote:
> 
> > Hi Anton,
> > 
> > Since you have tested this patch before, could you give a Tested-by?
> > 
> Done. V2 works fine with Milk Duo 256M with 2 channels RX and TX working
> simultaneously.
> 
> 
> Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>

Thanks

Regards,
Inochi
