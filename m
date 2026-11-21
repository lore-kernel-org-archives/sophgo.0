Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272538;
	b=gUlhBFCBaNqSVlM49BA6BXQ1ykUFtRG94/cGkmqgl/dFcV7korV9fWv23WSkk1ovyTTT
	 ady6HSnmu/HEDPSpVH3N/xgTtkhaaS5auQWQ3Hs29GC3vEOhSoRPp0W90noQGx4nIvRV5
	 wshY1ocqo/UXFK2kLV4+/58ns38A23AvzqEpQj7JxgIkHP4R3QXNAydQFitwRp6eksDIC
	 qRc7FM4OGaPX8Yk+WfW7kXJYrUVoZ3wW4pQqvFqzHUJb5HXzMb6Hb68HyEOhGj3B9uDTy
	 pA8WAhZOOu+z2+Wx6zOWungr4Sliq+ZrzA/LPVt6i7jkN947whPL2Wm0ekqx2NrtJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
	b=FBwx6F0sNccxgle5Hek7biKBme6N9lvbui2ktIad5JLiUVEm2VKl46Vv75OAxomYa6pe
	 9IumUgEMgkh7Dn8sVVT4PTLvqf5FUrgVuaXL/Mm3h3tlVf+h93FawTRXPZO9W3S3wEiDq
	 iuwVPobJGCtSvzmj9B52angoX5gPzo1b2kDT2rA2FWKxKFqgdeM75ANrhrzHEgkSWmO5v
	 D+oAzGgRtGp5A4bLUNjRZ5OS81WjYVaPdT9qOw1cqRyyFka/RIuvWt6V6BZ9xq546Cv1a
	 ro5WVA6mDVDCP1K7FLAWXGX7QYtLBwnpweksLxC1ELwhrFM6I6SSYZLeRh4Yp8OJfyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6NKf1rl;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC4606A320
	for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 14:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6NKf1rl
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso817824a12.3
        for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272536; x=1795877336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=C6NKf1rl9xHzVWPlztjmkvAwscDUXvDwstnLCHnwV8d/mQ8gKYth0x7lejEoO68A4T
         JUxJFCv/XfCquY1EQCbixPfgkjfU2M0Fn5Kg/sLylLi3T54fkkXWFYEs9wDdq4bFfVkK
         uHUneTAYStPeFLARbgdhyD5zBP2kvZDS3VVqFz6KzyZjKLX0u1wLEUa8mz+dk+7WQyl7
         uvjmGCbN9TssT6aQvGtFvq3RqXMjcD/CL8yVjTRgYj01M5er/Y9BUcyMfws7Pauhqj4m
         4U/s4Xn5c9BnwLEmbqxcCEIw0Gg4I6sGb8X4lgUuLgHhIec3+/nHGiDSlRAwJd/FBQZr
         SCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272536; x=1795877336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=bmpb8zPry7vfjMzUyQLcegMQVfx8bxyZt1rwQJNUmfciF+9LfiiExD4YlVuOpzG13R
         xXw2XosLA3jvn3x/Brl72KUKjQanzZgV+roFRd+sUrw2leKleDWeguI+YcS8PH5/M1Zd
         FVVBom590P7Cz+XDc66jThf63yB1+S8cmQEmEIki5qqDXCndpRUNyITrFAjdwWJ06mto
         FM6RqfDvnejsBQw2CbTFmp8LaWsYx/4s8TFmKJYi87R3jMgwIrQ75IGMFmXSLWrJkHTW
         661scxfZ8Pbrg88DnCNLFhplu8zShqqwjOOSZRk0Ih2iZ6Q0ELkaSTREuthglJf0dLtt
         lnFw==
X-Forwarded-Encrypted: i=1; AL+hErE6xIgICTMERBAwfv2Ls1CaqC2wuc+noMMdUKXMyK5L9l0iclSKBk5Zm6qCr/lZkrbEDLgINDU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+pnKhF3DBclWEGRPudcKMJQQeUWWV7DwK0y4DtmfbRDMwp0ScG
	qJgUtwoCWQQagJeF0lcitdWuFNcTH73S+nLNs5FS83imuX5m2XiUDWEv
X-Gm-Gg: AZFdTZcokDbtSh8Xqbf033vIWV6BiQJVmH4b/iVjzTMivgcxaGsz4xlq3ll+JzbpdLX
	1tu8bX1GYhk9fOhCCPflWzR+sRDj7DZq5ABUe/JQpmnACEW3H2s4g6V79dRl+M6ClEkN1ll+RLd
	3+3+ti6bGBfRmjWxptylWX8UiO/oYm+tvrNdSk155i6PzdjLyHmdSK65KNIoIzkNcwJp4r42Dym
	PLA206zA/Ti8BvpfqXXCsyallDQgn1kUA3cqrFLhlcVIIZnzmPp/2wx8gk5kj5YIowzgVxZIPDi
	C+XYwIFf+50qWcL+x8eelb52pTkx5UG6owHXMkeVNYFwZAzwWxo1ib4uQTrhbJ1EJkrMKzq0jyu
	Ce5s7d+/NKknC/jw8RkN8dD5OIZGaNoLxnagLMh4DzTSiWY7hzwe1VsnKnKM/k8Anc7gxlkVVpZ
	24WAhskSc6DcOF4648mnxg3/w+vYkGoqUJZDrTPaQLHPe5ddW2z/Y9s6M/UQx2LC7TyEk8+q0gw
	WtAjdOohZlnUrz3HfjImWQaADiYzv7V25wxCJjn0nQudQ51BN7ZUzwQgcjsP1LcD8APjEfUZLc+
	yZVsIURC55dtQ/aKOJlLcJZfMkh0ERsU1g/tpVWTfHiY0fvDhLoKY+9mjQ==
X-Received: by 2002:a05:6a20:244b:b0:3ed:bbab:9386 with SMTP id adf61e73a8af0-4014d35ab9cmr6017467637.42.1795272536129;
        Sat, 21 Nov 2026 06:48:56 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3048343b3a.36.2026.11.21.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:48:55 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	"Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Atish Patra" <atish.patra@linux.dev>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Chen Wang" <chen.wang@linux.dev>,
	"Inochi Amaoto" <inochiama@gmail.com>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
Date: Sat, 21 Nov 2026 22:48:45 +0800
Message-ID: <20261121144848.1277368-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bb39f961-0589-4a3e-b649-888cf5edd3a1@app.fastmail.com>
References: 
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 13:42:20 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:

> 
> 
> On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
> > registers end up mapped as normal memory.
> >
> > On Milk-V Pioneer, GetTime() reads the clock controller registers and
> > faults:
> >
> >   Oops - load access fault [#1]
> >   Workqueue: efi_runtime efi_call_rts
> >   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
> >
> > Use PAGE_KERNEL_IO for these regions.
> >
> > Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/kernel/efi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> I can take this as a fix via the EFI tree if you like.

Yes, please take it through the EFI tree. Thanks!

> 
> 
> > diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> > index 2d3cc57b4535..11e85d0ebc91 100644
> > --- a/arch/riscv/kernel/efi.c
> > +++ b/arch/riscv/kernel/efi.c
> > @@ -22,7 +22,7 @@ static __init pgprot_t 
> > efimem_to_pgprot_map(efi_memory_desc_t *md)
> >  	u32 type = md->type;
> > 
> >  	if (type == EFI_MEMORY_MAPPED_IO)
> > -		return PAGE_KERNEL;
> > +		return PAGE_KERNEL_IO;
> > 
> >  	/* R-- */
> >  	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
> >
> > -- 
> > 2.55.0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
