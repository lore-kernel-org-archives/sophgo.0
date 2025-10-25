Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E0223DDA
	for <sophgo@lists.linux.dev>; Sat, 25 Oct 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761393504; cv=none; b=NoE/Nf66QWjHfqRa9yQHF3WiBkPNBWFJ1XA+cvtJJ5/BB4Qs87uLvOY/ZZGHtMcqbjjBvM70BUcr8VwRC6pgZ6pZsCNqCu2XE2m6/9lY3pYu8oluWMNSNSw4l8wKbzNmumCV6J97GD6MGnkjmWD0o0G/Q+orRDVzes2/QXdt46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761393504; c=relaxed/simple;
	bh=Dq8AJOmwfhEJ4N/eqWoVBUPmAtuFUn4vvyR6OHjX8zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK0V9UOxmBMeGHZZ1bKGeKlJuPDKiD7/laL/9X2sZ5iJYZKfc9syP+PGfBSd7UWOaOV4dL6bxEMwv6WzmuY/ZgGyKYEdbdrpAkefRfLk3zRkWU8B5un2CVfecu7H5tZ9M4Z5Z2HM2HFD3BZ6JAW+QiQOWrIaRvAaE+/XByJw2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqP838Yu; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqP838Yu"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-556f518b527so77499e0c.2
        for <sophgo@lists.linux.dev>; Sat, 25 Oct 2025 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761393502; x=1761998302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I9TkdogdsV9nixdXBith0cDlYgPpHBpTVoAhEFR6cE=;
        b=dqP838Yu8+4eve7vprczgTEVWbQ3FeVeApiavci+jSo5oUMUQ7xOX6zBrGQsWWExPk
         QF4XkNvbI1xJpohPRjEGzbOyCq5JFWCylcwgwDqgsxGhAa96Rhb/Wg8IqryfFkJ09AMi
         eZrOqem57ESHAuzULtbiZYuO5wn5aAdqBxlzv/WtPcJzijRfAbDM1HmoFfwZmGaN3rGy
         Q6LURnvIUjAIVnIbbjG6wEbau3qzt90nmPfKl5gZ6UmYFV0olmGZrm807qqxFaTRnzYm
         /8Zvbo8Qic7aeiBLay4F9+imlabNlpfEZ24s1yt6knYYyTZQmugumY6tvST394hVT2Hp
         7d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761393502; x=1761998302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I9TkdogdsV9nixdXBith0cDlYgPpHBpTVoAhEFR6cE=;
        b=uMj9mx1AnQKJULliubh9VH/FUM34Jb1JIuKojNx5pqdLfQpqgHADO/IkRlAa6Jov0b
         KOE03XjkmSpECq2X6BMEKOeshTSEmNobr5t+truVe7ahiz535+hJSG+DteYfcxbQkZ9M
         xLwuG/LgJ/xCXWA5NDYeCcjp7kMlno2mi4s9uex/Rb2PEdamefo4c/hUjZJXC+xLgwAs
         PtkeLKBPhM/Rr4Kr6WwfoN3MzMKkWLmIlxyw/gvfI894onzWnmEOaRWvo9EvAR1W/Ch/
         4rSD+nMKDt5tr2MFwphNa91lSOYhs34o5FbxHLa+Sy5FlfIUhUrnQ+DDH0HQ+X0+MGdz
         PjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7wgHREIwQ4EdaV99cB8Zac0KSyhUxZ/QGaR7jXnW3/Gb79kE8ptztxN8LUgVUlq9XFD9RZXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuuvoIcBIJnlgDVBLdmUeH2+vDyw934aYDJ4vOQXgQuJ3FhMas
	RCC0lZKWckQPS1sRoP0hm+2kh4+G7172H6wo5sgCs253N0q0miDfJdpIKECKvxgKcVV86Q66Et7
	vrGcSw4xPQXIRSOvNvlnETb+is1Rd20E=
X-Gm-Gg: ASbGncuep7nAkHcyTZvQrcLGD8pkSTf1aW/6EMaPaPYC8CJYiPaqbJ3NN6bJJMbgMKB
	iwvNiLjb7+s1p3D2m9lmJW0Uf7RVoB5cmxFtpCHsv3BKthCp9mD2E00a+rnwGQbGSM0tPgmL8Wy
	qcJ0qlmohV/iDLT8ijRPgHmIzwlKB8JVWsNImcMcT6dgwXPtd1E7c573QLYhnEBUbVbtoxrfeMH
	D+vHO4u1INEOEd14FN5ivOQwZGA59hlaIntFspLh4rujjFAnffGGn6ExjBHtNWMMDZbwFOA
X-Google-Smtp-Source: AGHT+IEjjxEtU4jsBOkQ9KzzJg48mbR9wHZxw8HVS/t5afsmBknagybFZ4yDuSvqyYJYMpWyOtsSCOSfKUdve+9kw7s=
X-Received: by 2002:a05:6122:e1dc:b0:556:9cb9:65c8 with SMTP id
 71dfb90a1353d-5569cb9739fmr2881748e0c.0.1761393501810; Sat, 25 Oct 2025
 04:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1760929111.git.unicorn_wang@outlook.com> <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 25 Oct 2025 19:58:10 +0800
X-Gm-Features: AWmQ_bkPkZoLoqCmIL-grA_sDMwqczj2smKSV0IWSOxGD1NzJo1hieHmZhU-890
Message-ID: <CAAT7Ki_4nkKM1-D_8ybwusxTTsR=Lf09v8Cx6QDWfuy8KLtbBg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, mani@kernel.org, 
	liujingqi@lanxincomputing.com, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:49=E2=80=AFAM Chen Wang <unicorn_wang@outlook.co=
m> wrote:
>
> hi, Han Gao,
>
> Please help test this out on EVB, I don't have those boards and just
> tested with my pinoeerbox.
>
> Thanks,
>
> Chen
>
> On 10/20/2025 11:32 AM, Chen Wang wrote:
> > From: Chen Wang <unicorn_wang@outlook.com>
> >
> > This new patch set is a continuation of the previous patchset
> > "[PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC" [1].
> >
> > The drivers and bindings have already been merged into the kernel
> > mainline, and this patchset will focus on submitting the remaining
> > DTS changes into the mainline.
> >
> > This patchset is based on v6.18-rc1 and the only changes since v3
> > is a fix to address the comments from Manivannan Sadhasivam to make
> > sure PCI address of the I/O port to start from 0.
> >
> > Link: https://lore.kernel.org/linux-riscv/cover.1757643388.git.unicorn_=
wang@outlook.com/ [1]
> >
> > Chen Wang (4):
> >    riscv: sophgo: dts: add PCIe controllers for SG2042
> >    riscv: sophgo: dts: enable PCIe for PioneerBox
> >    riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
> >    riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
> >
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 12 +++
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 12 +++
> >   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 +++
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 88 ++++++++++++++++++=
+
> >   4 files changed, 124 insertions(+)
> >
> >
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

EVB1.X/2.0 can be started normally.
