Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1603DA5C4
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402786; cv=pass; b=Alz5/zJppHFNXm3IXPj4T3tZzM3CV8RH+euHVuQ9QR8om5hzlpVffwQL7sz3Z5R8OF8/JvtOeXsYtjjpbN6t9jJo5ZDkvvTn9iUkbkJee6WGcaKg5KNrvX/E6hqiHaNYK+jc9oHfs0nfvbr682ZsR+EjBdBPbfoYS/Fz8aw3pr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402786; c=relaxed/simple;
	bh=v4IUuaZKV+xEmq1slT8DS9LrLwlB25NbIn7rYDLeIS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVo5JJnRRHtFr0L9KCb9cS1SVJJE/HpWqwXilytBJtpe3eCZpM32KmaTwdsx/D1+SbAmCm1pFqFgo2qlf7Rjoo5x+lH5MtVApNzsN3VXQYQRCulcu5O/gGicFcegy9UAYMOI7yzXKCjPHyjz7pIfqIbVFPX58E6b25qOKhnTigo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTGYz9lH; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTGYz9lH"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2341831e0c.1
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 05:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780402784; cv=none;
        d=google.com; s=arc-20240605;
        b=Jl44DsyToaW7gb7HpHPfQ/O6T1/HGJmviHKSImtRoEwOvRhRqLIx3628E9A7zVzEGe
         nyYqbA1wE1KYRDVHunHZMaG5bYS3k8K1KwuJUFSIYe2Tn7CXnk3kZN7XTCIPRPeFMT7x
         Yef0Hul3usB1yjgdDx1/IGkfxYiU0p9A6vNevajuuD8zazi9Za72wfRyQnct7g5s/3Sm
         3AVoc1I5DO2WDltzRaHrw7Z2g41Xh1gdO22hUVF3KZoMT957+QPesxVQCOUbctIw01ln
         UZ4pIIYlcsQSjaEk0LXO2nb80hY/pyW06C5FyqCBBqA6RvXxG3+gX51jGaV/fANr92Hy
         FEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhO7/CQX4Jb3qUCZGPTm1Stth9Sth8RyGOcQ3oumNDc=;
        fh=ffpqQZ4OtlhgwTklcPVDp0FYFmrbbSP+NkogwR8wb64=;
        b=H+MAg6SCtO2Q0jiQ3anaIZsPznsKWzU9V6uuy6eGj1kicJ/fQqxMuF6ez//pwecix6
         nO1HJGM23C8HCEU92E56y+5m7Tdv+6EjiS7OT7g51MkZHg585LfDT6AvYSVeW2bMzQEg
         v8xjftwLBAtDGcrQu5t1eKO6cHKbb1HLfcqv34R+7S+FS0VbuDILBkUmdmI5nVVVpPvM
         FT9cqHJU64ANyajvzq4X8GNBH1LC77rl7XkzvFB34EEKYM/bW8sUHSezh/CHX0ww6xrg
         m9x1TLJRUzjW59AoGwb07NyGiaK+eb+gCsGEv8fOsYOAtGl0W/Xbfe8Mu7GP1uqHnHVq
         VuMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780402784; x=1781007584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhO7/CQX4Jb3qUCZGPTm1Stth9Sth8RyGOcQ3oumNDc=;
        b=GTGYz9lHC8B74osE2PNVQIhFTCL+WIssRDcONUfXVJJBa3td/UwcrHoItjGx4mxUJF
         DbqJfid0N8ozBnDgG8sjVwU5R+dXhefJjm7rYFlnvvBiAKIv/LAqeOSdsWv4gBNvFmJO
         0NpwV0lR6W9Kn7PyYJnr8hgqLReTLDXIZuW8tEIO9yhpVHrbgyNdin9tSdueDKUhBIyX
         7BOolsYF65Zsh4voe6l7i51ozgXMub3+9XAXafFcf0RnsSVcAx4nYHWHJ1FZKc1axWhU
         sxNVuXW5aiwAgoQSasV4Ktj2gnXrtu7w60pIQrZP911oVnqX3gRuxmK/9IxSVryFcsso
         ZxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402784; x=1781007584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhO7/CQX4Jb3qUCZGPTm1Stth9Sth8RyGOcQ3oumNDc=;
        b=WvdEq7ai77s4xnvdM3mX5IFfxiuXK+67a79+DOo/jp6O1i3aOiEFS6g7wszlG2d+eV
         sNtcbAWPOyP7ktXCNAqaS9L4475wumnfr/bgWO5AMYnX5GNWH7u7e0vsmMV/OnRE9eUD
         AbbOUkXsXqlCYr1f6yDM32jlJytcmCNNfTf1E0XGhc2BH7dNypUWE5ay0yuQ5Tac0q9o
         po3fQ2prUsaRTOFVpzXKrkRZPRzfto7FPlTqxbrJtWKQcZtRnSsfEsRFltyMBlg3r+4N
         m8G/FHoAjkq6qcli3SGPmJZEgcR8I8LqhJdSO6pR7g6pI5CN61Mnzk1RPFxRBu1xARsA
         XzEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l+NhE0dwCrSvGO0Dy+5FGdMhheufZOMNaePyBzHLw0qUY9lKFFCYbK8QJSQANzPKmG6DDVRI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRCIhRDS9JZMidzv5KjH/tBsdaiDgYdygeYdOCXB3q+Qlk7npy
	pvZWBMiMo1E0Qe22V0Li+5qp8TkycEZPKUXWKyTVyWuDEPafrrq97qJjmkk5v8mNdayoE1HnYKu
	volvf5D6Nz1i0COO27LCmjrvdj0lzpw8=
X-Gm-Gg: Acq92OEcPdWgcSu3TILEaVB70Uxxj3OT9EhDJTatfqZYoCy4vIaXsHMXZWW4Y9kVYkm
	BCKFY5AG1rT8oW4Yx7IEImF+Bo/g7KnYVWOBaoKJFSe7y34gYwh0N3Qj+dppAI7NsxDCIbv96Ke
	HbRRLwujScyYewKwrOacNG2msngssbaI6S9t/699kbPVZgPC9Ciy7Yt3tpQTYrxHQXnMx093UGl
	NLM3YIMoAJC9noxNK1V2QOKZ5IDOz45Ku6tYpONCcErFSSdzEdmQzoHC7w+b5En/BJf+RbgCX2m
	088DFH4ucormPrLhZVN80TJAa4NIPMZTZkhC3pUC26XegUrPB4I=
X-Received: by 2002:a05:6102:4404:b0:65b:47:2c8 with SMTP id
 ada2fe7eead31-6c68a15fb5fmr7320092137.10.1780402783778; Tue, 02 Jun 2026
 05:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ahu57vcS0oOFmCI9@mertle> <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle> <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ah0rA-c34RLkHWYt@mertle> <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 2 Jun 2026 20:19:32 +0800
X-Gm-Features: AVHnY4ITGZ53xSGemHMxUVhukY7OC8fx4fl6QG6Tu0Mfk-15q8qUdxa0BXp0dAI
Message-ID: <CAAT7Ki_=jGo1jbSBWmr-dQHT2pFovL2LAjcW0SN9F0Xm-uLkRg@mail.gmail.com>
Subject: Re: SG2042 SATA (DMA?) issues
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Michael Orlitzky <michael@orlitzky.com>, sophgo@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>, zhengjingkun@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Michael

Based on the new firmware with DMA coherence, we tested the following cases=
.

Test method:
mkfs.btrfs /dev/sda1
mount /dev/sda1 /mnt
f3write -e 128 /mnt
sync
f3read /mnt

case1:
2042pcie - asm2824 - jmb585: failed, csum failed.
case2:
2042pcie - amd b650 bridge(prom 21) - asm1062: pass.
case3:
2042pcie - asm2824 - amd b650 bridge(prom 21) - asm1062: pass
case4:
2042pcie - asm2824 - jmb585 + kernel parameter libata.force=3Dnoncq: pass

Based on the test results of the above four cases,
the problem is suspected to lie in the JMB585 chip itself.

The test was conducted by Jingkun Zheng.

Thanks,
Han


On Mon, Jun 1, 2026 at 4:00=E2=80=AFPM Chen Wang <unicorn_wang@outlook.com>=
 wrote:
>
> Hi=EF=BC=8CMike=EF=BC=8C
>
> On 6/1/2026 2:47 PM, Michael Orlitzky wrote:
> > On 2026-06-01 14:06:29, Chen Wang wrote:
> >>>     * SRA1-20.fd (20251209)
> >>>     * fip.bin (20251209, from the bootloader-riscv repo)
> >>>     * fw_dynamic.bin (20251106)
> >>>     * zsbl.bin (20251215)
> >>>     * mango-milkv-pioneer.dtb (20251215)
> >> Are these firmware components correspond to the https://github.com/sop=
hgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36?
> > The dates listed above are before any dma-coherent patches. This set
> > of firmware files is OK, no filesystem corruption.
> >
> >
> >> Just want to double-confirm if we use
> >> https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7=
893937183165af36
> >> plus the dts dma-coherenet patch, how the SATA works?
> > The older firmware, without the patch, works. It is the newer firmware
> > (plus the dma-coherent patch) that appears to cause the problem.
>
> I'm a little confused about what you mean by "newer firmware." Do you
> mean >=3D 017a5aea or > 017a5aea?
>
> Because in your last email you mentioned you discovered the problem
> starting with b379b067.
>
> The firmware's tree log is as follows:
>
> https://github.com/sophgo/edk2-non-osi/commits/devel-sg2042/
>
> latest commit
>
> .
> b379b067
> 017a5aea <---- dma-coherenet patch was submitted together with this commi=
t.
> .... older commit
>
>
>
>
