Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860DD3A2553
	for <sophgo@lists.linux.dev>; Tue, 31 Mar 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984087; cv=pass; b=Wd4rlEz1t8iW/Lfq/REqXk51rEBAr3GtxBLS+PHgZ5s/3tSzGo3pSRd0gjfVWw6jjW+rBZ/9p/EgtR3MMaIo4CMdVEwOmxATSfbxDt9LFdVzv5Aqt9a0dfDJyBIJPFjSJgzVYtcBN/87fLrjPrQd3zji6NJcPu9S32oBjIfokl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984087; c=relaxed/simple;
	bh=cJxCjybLxyxpFlDM1A8f3u3BoWGjrWbUTZYFDV1UWVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFQrDSYQdQZz8PgeDTsD43w++Iluiln0zWY6L0id7mPeCENMgEWTnMQRQFUi2Dy/Clndk8QFIgjCEu8gH5iUCa5E5AxPAB/4en135t+exMPfIRD8/tOWv0UsN8piU5B8LjFJg3JD5gabmXJK6dxFIOs6QmFio9XKy5q9LcZGekA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMfKkWDB; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMfKkWDB"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d36e7d8e6so3867101e0c.2
        for <sophgo@lists.linux.dev>; Tue, 31 Mar 2026 12:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774984085; cv=none;
        d=google.com; s=arc-20240605;
        b=FFag4BhDKhy6ZbUpLQgS+Jq0p6gDNoQzX1YHj7u++CNgmUsWSYHfRA/DTMADWLer39
         y1/KHeZVK9CxVhr1mPdsXyttJPKkB6jJ3c3v4xrIdAg+s1ACiYI1Ob/JaymWDmwirxCe
         NB4MRBogkmglOuaFPHnEllC+0PqpzZv8Zr3j7vIQpk0jZomTYocWxUsEstAKcjUBuO2g
         RAbLybgaBxilrDCbKSR3ATjGJrq2r7EYgPk/s8+DlcHj4kiPVe5qnLyqTl0kUwu+jr/L
         PoPJwF+mLbROMhmDCdnRQkKr3VcpBYAMtPZiZDGnIt9KsieR6l3IPiVfZuDK1+X5H4wy
         HV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        fh=2Lc88Q9szYms5BoREV1YpDZOYgkDOO4k+AxraIprGOk=;
        b=kpJjvKky3ljDe10SJDPsU4pKyH4sws8+q2e1LE5HkuLi+r11/D/gIr63OeG0UQnAqA
         Knupol6hRGhJ1LiHma920OQ+bru5+UxndT9y+3oqGGZVzX19MiGnu9rITxZ9B68B3/6E
         uza7FG0UlI9wm3LHKn/6sBbe7tNcvkRihj0PNRQxTt1atmrHmudlEVQJWGROKS+62Kt3
         6kmweRN3dN7LtRor3l+ALFeQYMPwKVdLthV/O91n36UJMdOae6GjFFY9yW3lga+IhKoK
         zikg2SiR3WH9zW/H89RdBiLFaZfyrGIwQslLgVuvfuj4/pJQISpDm7NVgo+dSg+QcbyL
         rgog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774984085; x=1775588885; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        b=nMfKkWDBgIQyL6a81LB45ZCBrL5Z4GMcDCfP02bem17AfUfkXAu8bGio6yjVNYfDGX
         c8MPhCPQmLcAZEQOSOWIZPP+lgONllZ1I6Ed0wKsxMzCnsqHhrJ4MZ3cZqnAWPM+VlMT
         IrIIA4xw9Fc7UorG8oT9cKTkuGxTmo5ElLgXeE05nTrX8CHOdsdzd3r4aH1dnMWXkj3C
         rN7e1F8ifJYtl2cH62x7k/fpC3yoXi8UTaG7z9qeAyVqHCjowJOw8IZwZ7xBTO5qRRHY
         N3DAJWCtK2yK3XIR+MJj6qMvnoz8U6ZdwJoj1+0fGm6gP8DmzmdeI6c15vYShoYdZSsw
         E+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984085; x=1775588885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODJKUE42J6Rz5kvZbkeA/0a+pxH8BWcdgMi0Zx2VGmY=;
        b=eZsxVj5IQF/ku0unqDf46YuNI7ZKdC7YWxJAlDKq23/v3B2Aw1cQdOr6F08T5ixjSc
         jQ2dlJPdmklu4Iy5ZlmXW+mclVShrWdSSRNoN5buQ7UhGmTa1+ccU/i6MGqJn+7UBHHT
         TIkUA9KifCtIxdETayVkYce0BJzh61D4764kXp33dwwAbTnCxkIKtkQ4ucdRWyQXdnIm
         YTCqGzD/CiBPqS2VexO/r0RQoSFasKgnS9H1n70cjPip9jNSPwuRp/rv6U5+80delVuo
         WY1iRejamm2pYHpxQBW3n1WlZLv1Yy3/qep4oQk0tSlpH/loLq8lkCjguTO28R1BCQ9l
         yFQw==
X-Forwarded-Encrypted: i=1; AJvYcCXqMyF3Lxxxl658152FmQhoYq9vHa+Mw9egKnpZxdkuOVBSFzjP9YzuUOA3mD6tYpgSYHx7g2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNzwMBpS49jY6cs3ln8hcVWEU1sZPpbYUs+2a6+iZF5UB+pdWs
	lX7cvcZFuyFLdLFZjG5eWv3c/a1ZYc34s76XpGXqmZs6Vlh9N2XXTmF8qDsQyicvD6LJFm6U5LV
	TPnOXN3+elrBdwSEMJcJhDMK3XGRkkJI=
X-Gm-Gg: ATEYQzzM6uyZdHGg9dE5ItGQtdV5xPHpscUHJUv2xQMWU4XCNpxRlRpSqH42i2bop6w
	b4qDHHuAgPrc20MYR9Ad1dHRMaE6gFZd8BV7kGkmD/ZpTWc9beT/HMKL+gWLyihNYEb54RUpifd
	61bVRB9IBRPXSasPfd+Elcn03dWKHdDnSvB35Vg4VJPkw+CxlgevRmp8f8bQxg0L6vD9RlRreRY
	ElqBLDoTMQQsb/c4M8RaS7TGYNt5/YPbbvtZbdfAD0ZiR3MoXZGMszD+o1dJYYV+58eGUmhaHjp
	Pauj1CZpcGX9W73/hOpaPnU0jN1V9ErG/o+kO0biaYL9phZ2RCM=
X-Received: by 2002:a05:6122:80aa:b0:566:341b:4ddd with SMTP id
 71dfb90a1353d-56d8a64f111mr484576e0c.0.1774984085028; Tue, 31 Mar 2026
 12:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn> <acwZOxbEJoAJrvGb@wunner.de>
In-Reply-To: <acwZOxbEJoAJrvGb@wunner.de>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 1 Apr 2026 03:07:53 +0800
X-Gm-Features: AQROBzAOzUNTpcwxA_0dIdIlemphcrqtCbFrf2oB8l5IhJydsZw1imk4dsqq1tU
Message-ID: <CAAT7Ki8_xKTOuX2kjmkfXrKMevxQZcO26jdmExx8vCXnu1_c4A@mail.gmail.com>
Subject: Re: [PATCH 0/2] PCI: Allow disabling port services on broken root ports
To: Lukas Wunner <lukas@wunner.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:58=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> On Wed, Apr 01, 2026 at 01:56:56AM +0800, Han Gao wrote:
> > SG2042's PCIe root ports only support MSI, not MSI-X. The MSI
> > controller provides only 32 vectors shared across all devices behind
> > each root port. When native port services claim vectors from this
> > limited pool, downstream devices are starved of interrupts, resulting
> > in zero interrupts delivered and driver timeouts (e.g. amdgpu fence
> > fallback timer expired on all rings).
>
> Have you considered setting the pci_dev::no_msi flag on the Root Ports
> to force them to use INTx interrupts instead of MSI?  That would seem
> like a cleaner solution.  There are already several devices for which
> the flag is set in drivers/pci/quirks.c, see quirk_no_msi().

Unfortunately, the SG2042 has no INTx interrupts.

>
> > Some PCIe root ports break MSI delivery to downstream devices when
> > native port services (AER, PME, bwctrl, etc.) are active. The existing
> > pcie_ports=3Dcompat kernel parameter works around this globally, but
> > affects all ports on the system.
> >
> > This series adds a per-device mechanism to skip port service probing:
> >   1. Introduce PCI_DEV_FLAGS_NO_PORT_SERVICES flag and wire it into
> >      the PCIe port driver
> >   2. Apply it via quirk to Sophgo SG2042 root ports [1f1c:2042], which
> >      fail to deliver MSI interrupts when port services are enabled
>
> I think we should try to minimize such workarounds or at least make them
> as non-intrusive as possible, so please try the no_msi approach instead.
>
> I also don't see why the stable designation is needed TBH.

6.18 has merged PCIe drivers, so a stable tag is required.

>
> Thanks,
>
> Lukas

Han
